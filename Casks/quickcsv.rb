cask "quickcsv" do
  version "0.10.4"
  sha256 "c1e5562ef5e7c03fd2f3d74da1c9b12c8e7037decf0e7858507badf6daa5f5d2"

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
