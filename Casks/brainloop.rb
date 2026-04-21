cask "brainloop" do
  version "0.1.2"
  sha256 "d2a5eadd7cd09eb1ddaf03424ebf2be3e836224cd268416b3fa212ff19b38175"

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
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Brainloop.app"],
                   sudo: false
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
