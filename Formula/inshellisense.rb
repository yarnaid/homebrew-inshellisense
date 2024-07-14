class Inshellisense < Formula
  desc "IDE style command line auto complete"
  homepage "https://github.com/microsoft/inshellisense"
  url "https://github.com/microsoft/inshellisense/archive/refs/tags/v0.3.24.tar.gz"
  sha256 "48f744155a6d88ff31aadf94c38f80ab6bba131c75a2fc366ce11fc3e6c5bbc8"
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
