class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "2.2.3"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v2.2.3/bssh-macos-aarch64.zip"
      sha256 "f3a2a4b926d86ad71b5a199954f5286215232c73a4b6a10a47b350f5ed4c64c8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v2.2.3/bssh-linux-aarch64.tar.gz"
      sha256 "17df3c7916273cdef664fc5528609f4ae1317f7907ed8a7ff0214d81edd14e78"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v2.2.3/bssh-linux-x86_64.tar.gz"
      sha256 "6e1ce2f4ae8a5850aeb24539926f9fe54cf8410ed53429c8a1cf64e1249021ca"
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
