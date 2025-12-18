class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "1.5.1"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v1.5.1/bssh-macos-aarch64.zip"
      sha256 "f6414ac4c67447f8a32589c0d2007734343702f6efc0e268b5d78daefd594e49"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v1.5.1/bssh-linux-aarch64.tar.gz"
      sha256 "6ccc469fee1dee1216aafa72686605ef9f69a75fb6deeb5ca2a6aeffb44f93a6"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v1.5.1/bssh-linux-x86_64.tar.gz"
      sha256 "cbf9dbf2b69caaafbe63cbab89115d6552dcf57cae03948868d03a4a8ddb9edd"
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
