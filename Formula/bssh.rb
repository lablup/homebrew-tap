class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "3.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v3.1.0/bssh-macos-aarch64.zip"
      sha256 "8332719c2a101503f7f6915ec26de3044ca37e89ef1afbad973fc79f4e576e75"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v3.1.0/bssh-linux-aarch64.tar.gz"
      sha256 "acbda47fad4df80fea4b705ebac8a51cbfcd05f0d9124ed342079b02b709ada2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/bssh/releases/download/v3.1.0/bssh-linux-x86_64.tar.gz"
      sha256 "0a98c12a61ba072eb504c81b6240ef351c52e92fe420cd4f1e1c59fdb0b19b0d"
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
