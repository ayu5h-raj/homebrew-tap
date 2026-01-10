class WtfCli < Formula
  desc "Write The Formula - AI-powered natural language to shell command translator"
  homepage "https://github.com/ayu5h-raj/wtf-cli"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ayu5h-raj/wtf-cli/releases/download/v0.6.0/wtf-macos-arm64-v0.6.0.tar.gz"
      sha256 "987071352a8abf7c9db121107e9c99165845ca158c7074612eac7730182e4a95"
    end
    on_intel do
      url "https://github.com/ayu5h-raj/wtf-cli/releases/download/v0.6.0/wtf-macos-intel-v0.6.0.tar.gz"
      sha256 "87d215ccd34761b5be707f16e650f83e5490bc3672ef90423df445060c6e68e3"
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
