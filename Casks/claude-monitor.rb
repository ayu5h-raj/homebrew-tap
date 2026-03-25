cask "claude-monitor" do
  version "0.1.2"
  sha256 "8feacb64bc03c9e6a4e6754ee19c281c82979f299441f8add8eceb20f0267ed4"

  url "https://github.com/ayu5h-raj/claude-monitor/releases/download/v0.1.2/Claude-Monitor-0.1.2-arm64.dmg"
  name "Claude Monitor"
  desc "Terminal-themed dashboard for monitoring Claude Code sessions"
  homepage "https://github.com/ayu5h-raj/claude-monitor"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Claude Monitor.app"],
                   sudo: false
  end

  app "Claude Monitor.app"

  zap trash: [
    "~/Library/Saved Application State/com.claudemonitor.app.savedState",
  ]
end
