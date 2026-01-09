class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "1.7.0"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v1.7.0/bssh-macos-aarch64.zip"
      sha256 "4f281f173984800b8994aaa13ab1f20d3f1bc9dff6d6acfddabd2f1146efc529"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v1.7.0/bssh-linux-aarch64.tar.gz"
      sha256 "f2ca39ba10e2557f42b8a8365af3499fa95935be07cbc209d222792c3df2b265"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v1.7.0/bssh-linux-x86_64.tar.gz"
      sha256 "9ae710a090e257fa658f85062295e65d730c9ecc5feed1ec992428663c8dbd18"
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
