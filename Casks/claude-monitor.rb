cask "claude-monitor" do
  version "0.1.7"
  sha256 "1c600152a8a05aa9db51e5bd9a92485f175217a567c2ccfb502018877d7f49cb"

  url "https://github.com/ayu5h-raj/claude-monitor/releases/download/v0.1.7/Claude-Monitor-0.1.7-arm64.dmg"
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
