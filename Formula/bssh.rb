class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version   "0.3.0"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v0.3.0/bssh-macos-aarch64.zip"
      sha256  "3395324832cf6836a3541216537f90921fe72842ccba05966ba5b02447be6586"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v0.3.0/bssh-linux-aarch64.tar.gz"
      sha256.  "19b3ff4976dc3a80c55497687e5f84ae075788eb2abe536fb45f6f308bebb9ff"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v0.3.0/bssh-linux-x86_64.tar.gz"
      sha256   "366d5f0e5531a3bf287b0a533c0427b552a3a20b6c55735805e698ff105e04d7"
    end
  end

  def install
    bin.install "bssh"
  end

  test do
    output = shell_output("#{bin}/bssh --version")
    assert_match(/bssh\s+#{version}/, output)
  end
end
