class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "1.2.0"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v1.2.0/bssh-macos-aarch64.zip"
      sha256 "cabc77b79be9022ffa31d9f53065c9ba4da1058261ac5143a41903ad5707941d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v1.2.0/bssh-linux-aarch64.tar.gz"
      sha256 "b749304cd847974f55f453ecff06f85a2424fb19d85364a0831cce340bb6955d"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v1.2.0/bssh-linux-x86_64.tar.gz"
      sha256 "4d373f625680ebf437b449d28e631c4725a8fedd89ab4a3ffefa253babd4b997"
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
