class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "0.5.2"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v0.5.2/bssh-macos-aarch64.zip"
      sha256 "c416a0c66354d6f319b29507ba66a200e613e7b2deef8d41236325db32c900f6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v0.5.2/bssh-linux-aarch64.tar.gz"
      sha256 "38f8297f9d1d5a735a3bb0ff84f7659ebb6a9a15ad7e8aad822851be40ab89d4"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v0.5.2/bssh-linux-x86_64.tar.gz"
      sha256 "1479d289ed986eb4ce8098f567638eab15133b9a3344ea5e01154c8d21ec0ce7"
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
