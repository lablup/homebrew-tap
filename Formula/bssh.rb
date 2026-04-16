class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "2.1.1"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v2.1.1/bssh-macos-aarch64.zip"
      sha256 "732a357c00716e1246e8ecb342908876615a24c63d607a5b0abb7cf197aece27"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v2.1.1/bssh-linux-aarch64.tar.gz"
      sha256 "72651370948a11de635abc165a8f6b4c67996c62a813a427189099d40ec5ef7f"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v2.1.1/bssh-linux-x86_64.tar.gz"
      sha256 "da28d0d2d7d791e463ecf4d7ed58f90179b0d33392426cbd68a51116abf7e1ec"
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
