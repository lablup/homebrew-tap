class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "2.2.0"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v2.2.0/bssh-macos-aarch64.zip"
      sha256 "d010a7fd31c7dd1c1d85d944805087fde21a5ecfcde54c1ec5e1ff500fa86343"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v2.2.0/bssh-linux-aarch64.tar.gz"
      sha256 "c0d6d26d0b361b315b06520b109baaeef2e1e43a780f482455e99dc505f3d64d"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v2.2.0/bssh-linux-x86_64.tar.gz"
      sha256 "0bf12194d09a15d91ef46ad76dceb10b68559202d33f796027c88044e6ce00b9"
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
