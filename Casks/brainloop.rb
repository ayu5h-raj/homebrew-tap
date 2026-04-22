cask "brainloop" do
  version "0.1.3"
  sha256 "19beb1addd5a6f48ab68ec09c6632e1dd880ac70b24ec5ec2f1e803648f16c76"

  url "https://github.com/arunachalam-github/brainloop/releases/download/v#{version}/Brainloop_#{version}_aarch64.dmg"
  name "Brainloop"
  desc "macOS activity-capture daemon with editorial day summary"
  homepage "https://github.com/arunachalam-github/brainloop"

  depends_on arch: :arm64
  depends_on macos: ">= :monterey"

  preflight do
    target = "#{appdir}/Brainloop.app"
    FileUtils.rm_rf(target) if File.exist?(target) && !File.symlink?(target)
  end

  postflight do
    app_path    = "#{appdir}/Brainloop.app"
    daemon_path = "#{app_path}/Contents/Resources/resources/brainloopd"
    plist       = "#{Dir.home}/Library/LaunchAgents/com.brainloop.agent.plist"

    # 1. Strip quarantine so the ad-hoc-signed app + daemon actually launch.
    system_command "/usr/bin/xattr", args: ["-cr", app_path], sudo: false

    # 2. Stop the currently-running daemon (if any). After this its file has
    #    already been replaced by the cask copy, so the running process is
    #    executing stale code in memory until we kill it.
    if File.exist?(plist)
      system_command "/bin/launchctl", args: ["unload", plist], must_succeed: false
    end
    # Belt-and-braces: kill any stray brainloopd (unmanaged dev launches,
    # plists with a different label, etc.). Ignore errors — pkill returns
    # non-zero when no process matches.
    system_command "/usr/bin/pkill", args: ["-f", "brainloopd"], must_succeed: false

    # 3. Repoint the plist's Program + first ProgramArgument to the canonical
    #    /Applications path. If the plist was originally written by a dev
    #    build or a previous .app location, it would otherwise re-exec the
    #    wrong binary on load. plutil is a no-op when the key already has
    #    the right value.
    if File.exist?(plist)
      system_command "/usr/bin/plutil",
                     args: ["-replace", "Program", "-string", daemon_path, plist],
                     must_succeed: false
      system_command "/usr/bin/plutil",
                     args: ["-replace", "ProgramArguments.0", "-string", daemon_path, plist],
                     must_succeed: false
      system_command "/bin/launchctl", args: ["load", plist], must_succeed: false
    end
    # First-time installs have no plist yet — Brainloop.app writes one on
    # first launch pointing at this same daemon_path, so nothing to do here.
  end

  app "Brainloop.app"

  caveats <<~EOS
    Brainloop needs two one-time permissions to capture your activity:

      1. System Settings → Privacy & Security → Accessibility
         Add Brainloop.app so it can read window titles and browser URLs.

      2. Chrome → View → Developer → Allow JavaScript from Apple Events
         Lets Brainloop read the visible page text (what you were reading).

    The background daemon installs itself on first launch. Your activity
    stays local in ~/Library/Application Support/brainloop/activity.db —
    nothing is uploaded anywhere.
  EOS

  zap trash: [
    "~/Library/LaunchAgents/com.brainloop.agent.plist",
    "~/Library/Application Support/brainloop",
    "~/Library/Saved Application State/com.brainloop.desktop.savedState",
  ]
end
