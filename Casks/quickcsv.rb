cask "quickcsv" do
  version "0.10.0"
  sha256 "ab3fc63f716465f8ca0b15bb3bee1e92da04ed38822072eb07fb733926007acb"

  url "https://github.com/ayu5h-raj/quickcsv/releases/download/v#{version}/QuickCSV-v#{version}-macos.zip"
  name "QuickCSV"
  desc "High-performance CSV viewer for macOS"
  homepage "https://github.com/ayu5h-raj/quickcsv"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/QuickCSV.app"],
                   sudo: false
  end

  app "QuickCSV.app"

  zap trash: [
    "~/Library/Saved Application State/com.quickcsv.savedState",
  ]
end
