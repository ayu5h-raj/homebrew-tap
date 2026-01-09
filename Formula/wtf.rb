class Wtf < Formula
  desc "Write The Formula - AI-powered natural language to shell command translator"
  homepage "https://github.com/ayu5h-raj/wtf-cli"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ayu5h-raj/wtf-cli/releases/download/v0.2.0/wtf-macos-arm64-v0.2.0.tar.gz"
      sha256 "b395cd9bda77d2dc446d609909c2b01d490e7bb1a8e47bd2b113b7e587f11496"
    end
    on_intel do
      url "https://github.com/ayu5h-raj/wtf-cli/releases/download/v0.2.0/wtf-macos-intel-v0.2.0.tar.gz"
      sha256 "9a1ad27a166eeb535b3c7784e2f7314cf335407cc9c4e31493809f6df9397413"
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
