class WtfCli < Formula
  desc "Write The Formula - AI-powered natural language to shell command translator"
  homepage "https://github.com/ayu5h-raj/wtf-cli"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ayu5h-raj/wtf-cli/releases/download/v0.5.0/wtf-macos-arm64-v0.5.0.tar.gz"
      sha256 "e5c0ae2de09508a88e32452bec6cba58a8de2b00b68478f0a4b4ab4858587ca7"
    end
    on_intel do
      url "https://github.com/ayu5h-raj/wtf-cli/releases/download/v0.5.0/wtf-macos-intel-v0.5.0.tar.gz"
      sha256 "c78120043922a7a82ac054d6b88c3a0b324b21f684ba617dce7e87f47bbf70d9"
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
