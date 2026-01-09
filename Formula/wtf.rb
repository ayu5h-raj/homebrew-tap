class Wtf < Formula
  desc "Write The Formula - AI-powered natural language to shell command translator"
  homepage "https://github.com/ayu5h-raj/wtf-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ayu5h-raj/wtf-cli/releases/download/v0.1.0/wtf-macos-arm64-v0.1.0.tar.gz"
      sha256 "10b618a9c997a30fbdf5289f44fed7bdc7bd7ea4eae64e5284a68f1e9ff99c1a"
    end
    on_intel do
      url "https://github.com/ayu5h-raj/wtf-cli/releases/download/v0.1.0/wtf-macos-intel-v0.1.0.tar.gz"
      sha256 "abf0cfa850454a501d2720847f4865eb8bfe37585a58ce10c17e40c8490da8c5"
    end
  end

  def install
    bin.install "wtf"
  end

  def caveats
    <<~EOS
      To use WTF, you need a Gemini API key:
        1. Get a free key at https://aistudio.google.com/app/apikey
        2. Add to your shell: export GEMINI_API_KEY='your-key'

      Usage: wtf "your question here"
    EOS
  end

  test do
    assert_match "Write The Formula", shell_output("#{bin}/wtf --help")
  end
end
