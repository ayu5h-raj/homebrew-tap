cask "claude-monitor" do
  version "0.1.1"
  sha256 "0ed6b26115549008ec4fbc6357f7bf767636dcad72fbdc7b5f371f0537dba0f7"

  url "https://github.com/ayu5h-raj/claude-monitor/releases/download/v0.1.1/Claude-Monitor-0.1.1-arm64.dmg"
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
