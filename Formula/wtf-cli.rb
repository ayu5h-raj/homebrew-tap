class WtfCli < Formula
  desc "Write The Formula - AI-powered natural language to shell command translator"
  homepage "https://github.com/ayu5h-raj/wtf-cli"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ayu5h-raj/wtf-cli/releases/download/v0.2.1/wtf-macos-arm64-v0.2.1.tar.gz"
      sha256 "a673810b6874d078e9a0a24ae530a6d045f21083e96c2fabe558cb9abbab6baf"
    end
    on_intel do
      url "https://github.com/ayu5h-raj/wtf-cli/releases/download/v0.2.1/wtf-macos-intel-v0.2.1.tar.gz"
      sha256 "474eec999b8bbb668e0ed63279c47cd7958643adfb4203201e9a89340def48d7"
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
      
      Get a free Gemini key: https://aistudio.google.com/app/apikey

      Usage: wtf "your question here"
    EOS
  end

  test do
    assert_match "Write The Formula", shell_output("#{bin}/wtf --help")
  end
end
