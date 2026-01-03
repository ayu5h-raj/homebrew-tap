cask "quickcsv" do
  version "0.3.2"
  sha256 "5352d5a7759449c81a953bd3b8c3d2862e2edfd8bc4bc5aeb256e3f9cc03ceb8"

  url "https://github.com/ayu5h-raj/quickcsv/releases/download/v#{version}/QuickCSV-v#{version}-macos.zip"
  name "QuickCSV"
  desc "High-performance CSV viewer for macOS"
  homepage "https://github.com/ayu5h-raj/quickcsv"

  app "QuickCSV.app"

  zap trash: [
    "~/Library/Saved Application State/com.quickcsv.savedState",
  ]
end
