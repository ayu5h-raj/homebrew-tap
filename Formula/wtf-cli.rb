class WtfCli < Formula
  desc "Write The Formula - AI-powered natural language to shell command translator"
  homepage "https://github.com/ayu5h-raj/wtf-cli"
  version "0.3.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ayu5h-raj/wtf-cli/releases/download/v0.3.5/wtf-macos-arm64-v0.3.5.tar.gz"
      sha256 "58cade8bf22089bb5a3e84700047d881a17f2ef107a8326b8050ab786f03d5bd"
    end
    on_intel do
      url "https://github.com/ayu5h-raj/wtf-cli/releases/download/v0.3.5/wtf-macos-intel-v0.3.5.tar.gz"
      sha256 "ea757c8d2c01011be73f14942d4f0df3fbdb32cf35c5540bb1fe2477489387bc"
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
