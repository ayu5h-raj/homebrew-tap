cask "quickcsv" do
  version "0.10.1"
  sha256 "9ba9caf80bd0bc67cafc8d8c69d7ec10eeb1de77f79a237487f9459a4f75b844"

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
