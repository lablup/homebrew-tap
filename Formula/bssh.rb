class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "0.5.3"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v0.5.3/bssh-macos-aarch64.zip"
      sha256 "b08d2906f2e6ca64d2d3dc7a9928d575ddd928d1b26bbe86e137ad5a05c2105b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v0.5.3/bssh-linux-aarch64.tar.gz"
      sha256 "34f93c918157abbbd20ef02ec05b20582b443ad3b85eb57c587e29e290cee9c0"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v0.5.3/bssh-linux-x86_64.tar.gz"
      sha256 "034664463e6ddb184caab6ea72e60725ebea681744ea4e6da6b203972d6e6563"
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
