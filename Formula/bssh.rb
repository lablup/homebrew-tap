class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "0.9.0"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v0.9.0/bssh-macos-aarch64.zip"
      sha256 "e44936f3fe2beb0eb27dc123a8d4f23dc7e7bf340eb650a5efc9e436cd0dffe6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v0.9.0/bssh-linux-aarch64.tar.gz"
      sha256 "0a9ced69440ee446fd1038cc37cdfc894cc1b8752516cfc8611c7358f98f7322"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v0.9.0/bssh-linux-x86_64.tar.gz"
      sha256 "ecd1d2ac44ea03357be2ab2652fe14c0e081b965e5eb831a1d6fae931136b66c"
    end
  end

  def install
    bin.install "bssh"
    man1.install "bssh.1"
  end

  test do
    output = shell_output("#{bin}/bssh --version")
    assert_match(/bssh\s+#{version}/, output)
  end
end
