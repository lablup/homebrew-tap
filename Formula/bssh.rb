class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "2.1.4"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v2.1.4/bssh-macos-aarch64.zip"
      sha256 "98534a42e8cea04a3b3630fd1201482a2070fe1c6ad2bcefea1e792bf61816b6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v2.1.4/bssh-linux-aarch64.tar.gz"
      sha256 "b8d2a0607b319566c94c4397829a2b88df62e348a49382533ad7948c24618a4e"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v2.1.4/bssh-linux-x86_64.tar.gz"
      sha256 "b2ce2e907df8a9ecbb9608ac6c0f7ba5746d0d0931b52d79e2b80775ee62589a"
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
