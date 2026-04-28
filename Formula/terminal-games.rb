class TerminalGames < Formula
  include Language::Python::Virtualenv

  desc "A collection of classic mini games you can play right in your terminal"
  homepage "https://github.com/ayu5h-raj/terminal-games"
  url "https://files.pythonhosted.org/packages/5c/51/75c12b3e548f22cd42107662726c85adc26f0bba58c20f8f40f267c50ce2/terminal_games-0.2.0.tar.gz"
  sha256 "f5fd463d7027642e1d951bf96485c66437d28b255b2654b621abae3665b69944"
  license "MIT"

  depends_on "python@3.13"

  resource "blessed" do
    url "https://files.pythonhosted.org/packages/9f/1f/f2535d0eb1fb8af7915f96b4d42810345c255bbbca39939a23e59c0695d8/blessed-1.38.0.tar.gz"
    sha256 "89ce6ec6567f7aced0716b73577b7a1702eb23c667838bb46d7d9bd48c36d1b3"
  end

  resource "wcwidth" do
    url "https://files.pythonhosted.org/packages/35/a2/8e3becb46433538a38726c948d3399905a4c7cabd0df578ede5dc51f0ec2/wcwidth-0.6.0.tar.gz"
    sha256 "cdc4e4262d6ef9a1a57e018384cbeb1208d8abbc64176027e2c2455c81313159"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "terminal_games", shell_output("#{bin}/terminal-games --help 2>&1", 2)
  end
end
