class WtfCli < Formula
  desc "Write The Formula - AI-powered natural language to shell command translator"
  homepage "https://github.com/ayu5h-raj/wtf-cli"
  version "0.3.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ayu5h-raj/wtf-cli/releases/download/v0.3.2/wtf-macos-arm64-v0.3.2.tar.gz"
      sha256 "c3cd683161900a05f6642defbcad83866cd2722634734c6dfee6704f9f8af4b5"
    end
    on_intel do
      url "https://github.com/ayu5h-raj/wtf-cli/releases/download/v0.3.2/wtf-macos-intel-v0.3.2.tar.gz"
      sha256 "4a96850cfb9c5401ab2b431e86b3d0171052a63f1c30c8c3e2751480418b8aca"
    end
  end

  def install
    bin.install "wtf"
  end

  def caveats
    <<~EOS
      To use WTF, set an API key:
      
      Gemini (free): export GEMINI_API_KEY='your-key'
      Other:         export WTF_API_KEY='key' WTF_BASE_URL='url' WTF_MODEL='model'
      
      Enable shell integration (Add to ~/.zshrc):
        eval "$(wtf --init zsh)"

      Get a free Gemini key: https://aistudio.google.com/app/apikey

      Usage: wtf "your question here"
    EOS
  end

  test do
    assert_match "Write The Formula", shell_output("#{bin}/wtf --help")
  end
end
