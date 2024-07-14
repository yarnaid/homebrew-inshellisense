class Inshellisense < Formula
  desc "IDE style command line auto complete"
  homepage "https://github.com/microsoft/inshellisense"
  url "https://github.com/microsoft/inshellisense/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "4b4f7dc3f24affe330b338f1fa4c4c6dd61c05c43bd2f2cff147b3c6a3c41407"
  license "MIT"

  depends_on "rust" => :build
  depends_on "node" => :build
  depends_on "yarn" => :build

  def install
    system "yarn", "install"
    system "yarn", "build"
    system "cargo", "install", "--root", prefix, "--path", "."
  end

  test do
    assert_match "InShellisense", shell_output("#{bin}/inshellisense --version")
  end
end
