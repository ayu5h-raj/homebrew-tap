cask "claude-monitor" do
  version "0.1.3"
  sha256 "fbce7dba8c1b861176687490383f471a0696b07583be3a3e474f2a342678a522"

  url "https://github.com/ayu5h-raj/claude-monitor/releases/download/v0.1.3/Claude-Monitor-0.1.3-arm64.dmg"
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
