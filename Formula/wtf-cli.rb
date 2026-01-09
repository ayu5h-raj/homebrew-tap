class WtfCli < Formula
  desc "Write The Formula - AI-powered natural language to shell command translator"
  homepage "https://github.com/ayu5h-raj/wtf-cli"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ayu5h-raj/wtf-cli/releases/download/v0.4.0/wtf-macos-arm64-v0.4.0.tar.gz"
      sha256 "b6e3e64dcf681b423837ecfc5a64192e3bc6de14bd04c2328565f5fac47fd3da"
    end
    on_intel do
      url "https://github.com/ayu5h-raj/wtf-cli/releases/download/v0.4.0/wtf-macos-intel-v0.4.0.tar.gz"
      sha256 "84bc8da64ebc2a3e3c1fb72549cd5a4dc8b28685cfcbe436c758905ece637e48"
    end
  end

  def install
    bin.install "wtf"
  end

  def caveats
    <<~EOS
      To use WTF, set an API key:

      Gemini (free): export GEMINI_API_KEY='your-key'
      Other:         export WTF_API_KEY='key' ...

      *** REQUIRED: ENABLE SHELL INTEGRATION ***
      Add the following to your shell config (~/.zshrc or ~/.bashrc):

        eval "$(command wtf --init zsh)"

      Get a free Gemini key: https://aistudio.google.com/app/apikey

      Usage: wtf "your question here"
    EOS
  end

  test do
    assert_match "Write The Formula", shell_output("#{bin}/wtf --help")
  end
end
