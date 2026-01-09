class WtfCli < Formula
  desc "Write The Formula - AI-powered natural language to shell command translator"
  homepage "https://github.com/ayu5h-raj/wtf-cli"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ayu5h-raj/wtf-cli/releases/download/v0.3.1/wtf-macos-arm64-v0.3.1.tar.gz"
      sha256 "18836abac1abac1b894b9365b6a4f7fe18dcaafb4d7f1f93bb27310c96c83d1e"
    end
    on_intel do
      url "https://github.com/ayu5h-raj/wtf-cli/releases/download/v0.3.1/wtf-macos-intel-v0.3.1.tar.gz"
      sha256 "90b35082c437643a022fcb2148fe165789c9cd9725391b0669f5218819f6d175"
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
