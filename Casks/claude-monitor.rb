cask "claude-monitor" do
  version "0.1.6"
  sha256 "8263bdd3391d8552eb8d620dfff3dc12f80d16a692c4df33d0b6fe833da897fe"

  url "https://github.com/ayu5h-raj/claude-monitor/releases/download/v0.1.6/Claude-Monitor-0.1.6-arm64.dmg"
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
