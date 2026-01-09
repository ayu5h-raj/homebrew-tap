class WtfCli < Formula
  desc "Write The Formula - AI-powered natural language to shell command translator"
  homepage "https://github.com/ayu5h-raj/wtf-cli"
  version "0.3.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ayu5h-raj/wtf-cli/releases/download/v0.3.4/wtf-macos-arm64-v0.3.4.tar.gz"
      sha256 "4ff86e0a61b9f8adc686cc67e427911db1327a77f9124f8ab7c07a30c48ec2e8"
    end
    on_intel do
      url "https://github.com/ayu5h-raj/wtf-cli/releases/download/v0.3.4/wtf-macos-intel-v0.3.4.tar.gz"
      sha256 "05b3365cd9e98d97e3dd1c433e04b9f7f1cf4b611b4c169c2113151bf6978442"
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
      
      *** REQUIRED: ENABLE SHELL INTEGRATION ***
      Add to your ~/.zshrc or ~/.bashrc:

eval "$(command wtf --init zsh)"

      Get a free Gemini key: https://aistudio.google.com/app/apikey

      Usage: wtf "your question here"
    EOS
  end

  test do
    assert_match "Write The Formula", shell_output("#{bin}/wtf --help")
  end
end
