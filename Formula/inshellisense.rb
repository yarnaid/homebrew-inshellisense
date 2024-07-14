require "language/node"

class Inshellisense < Formula
  desc "IDE style autocomplete for shells"
  homepage "https://github.com/microsoft/inshellisense"
  url "https://registry.npmjs.org/@microsoft/inshellisense/-/inshellisense-0.0.1-rc.15.tgz"
  sha256 "e171ef357191c114422789e4f7a5aab37eba7e01a71f3fcd36d37eff8e1e835b"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/is", "--version"
    assert_match version.to_s, shell_output("#{bin}/is --version")
  end
end

