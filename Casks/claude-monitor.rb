cask "claude-monitor" do
  version "0.1.5"
  sha256 "1030d4594bdc963f65554bec234dee5c73154e90282855f775831c321b7bfa1e"

  url "https://github.com/ayu5h-raj/claude-monitor/releases/download/v0.1.5/Claude-Monitor-0.1.5-arm64.dmg"
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
