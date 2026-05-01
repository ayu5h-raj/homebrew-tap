cask "claude-monitor" do
  version "0.1.4"
  sha256 "3460ef22ad3fe3145c649fbd5a94be1a4aa5699712318c20bc176335bd648624"

  url "https://github.com/ayu5h-raj/claude-monitor/releases/download/v0.1.4/Claude-Monitor-0.1.4-arm64.dmg"
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
