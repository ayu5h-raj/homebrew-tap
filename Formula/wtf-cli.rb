class WtfCli < Formula
  desc "Write The Formula - AI-powered natural language to shell command translator"
  homepage "https://github.com/ayu5h-raj/wtf-cli"
  version "0.3.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ayu5h-raj/wtf-cli/releases/download/v0.3.7/wtf-macos-arm64-v0.3.7.tar.gz"
      sha256 "1045d518a56cf3d15d9bfcecb03722eb3658b996f396351bb32f28d957924872"
    end
    on_intel do
      url "https://github.com/ayu5h-raj/wtf-cli/releases/download/v0.3.7/wtf-macos-intel-v0.3.7.tar.gz"
      sha256 "820eb6d26b3fc9d5018f2876f0fc255422e79f05043e2cd9ad4f75e9daced28e"
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
