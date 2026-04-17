class DebrisCli < Formula
  desc "Minimal Mac storage cleaner — terminal UI (TUI) version"
  homepage "https://github.com/ayu5h-raj/debris"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ayu5h-raj/debris/releases/download/v0.3.0/debris-macos-arm64-cli-v0.3.0.tar.gz"
      sha256 "bd857b6cebae84b2ef59be1324ba86b86029c19796632e5daf717c0d8a123352"
    end
    on_intel do
      url "https://github.com/ayu5h-raj/debris/releases/download/v0.3.0/debris-macos-intel-cli-v0.3.0.tar.gz"
      sha256 "2e433159ced5e05383b851d956b1706a2d5e54526777f3f12452013a81f3f37b"
    end
  end

  def install
    bin.install "debris-cli"
  end

  test do
    assert_predicate bin/"debris-cli", :executable
  end
end
