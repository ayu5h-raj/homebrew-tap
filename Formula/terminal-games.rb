class TerminalGames < Formula
  include Language::Python::Virtualenv

  desc "A collection of classic mini games you can play right in your terminal"
  homepage "https://github.com/ayu5h-raj/terminal-games"
  url "https://files.pythonhosted.org/packages/59/ac/13f72ec93849df7d762a6f5e95fe33f6cd1a38168a9db1c2cd86ba2d49b9/terminal_games-0.1.1.tar.gz"
  sha256 "433a078e3ace709fd06f17bc5417e2d5cc34fbc8d261b2087b9b1a8ccf0ed67c"
  license "MIT"

  depends_on "python@3.13"

  resource "blessed" do
    url "https://files.pythonhosted.org/packages/e6/0c/658dea9ba35fcea19e6feaa8ba0d2dbf8cac9aeaa1f9ab1d77d36f534757/blessed-1.32.0.tar.gz"
    sha256 "d4090e9908cf86bea15a5275845c8bfc69c4c34eb6d22de07c65d26f1e54a918"
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
