cask "claude-monitor" do
  version "0.1.0"
  sha256 "484915a2accb26de2ad70522f74d6cd007bd5698cc2e686e28331b75188136df"

  url "https://github.com/ayu5h-raj/claude-monitor/releases/download/v#{version}/Claude-Monitor-#{version}-arm64.dmg"
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
