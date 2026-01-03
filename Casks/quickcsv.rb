cask "quickcsv" do
  version "0.6.0"
  sha256 "4616b80b768bf3c6df44e54b0dceefa5718bfd526ebbc54daeb77fb3f077b192"

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
