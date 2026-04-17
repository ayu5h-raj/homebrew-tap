class Debris < Formula
  desc "Minimal Mac storage cleaner — find and delete orphaned app data"
  homepage "https://github.com/ayu5h-raj/debris"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ayu5h-raj/debris/releases/download/v0.2.0/debris-macos-arm64-v0.2.0.tar.gz"
      sha256 "d35e52bc3a1f43610c0c1fdb57a739c760637a6146f3dbc09e2e02681e85a0ae"
    end
    on_intel do
      url "https://github.com/ayu5h-raj/debris/releases/download/v0.2.0/debris-macos-intel-v0.2.0.tar.gz"
      sha256 "d7679b5a00fdd679b39f004ab0bc8b51dfd56d5f489c8b6d83530ff257d6aee2"
    end
  end

  def install
    bin.install "debris"
  end

  test do
    assert_predicate bin/"debris", :executable
  end
end
