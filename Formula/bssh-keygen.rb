class BsshKeygen < Formula
  desc      "SSH key generator utility for bssh (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "2.1.1"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v2.1.1/bssh-keygen-macos-aarch64.zip"
      sha256 "c85b6924f8bb6decc9a4e6ddc6e70d108f06386281cdaf647ff746eabfc656bd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v2.1.1/bssh-keygen-linux-aarch64.tar.gz"
      sha256 "f59660dae61a4d4a948b0d3d2c600574885190d585fcdc2c8e8bf86908332b19"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v2.1.1/bssh-keygen-linux-x86_64.tar.gz"
      sha256 "f64c9c73bd9c60b62466ebb67bc11235aba11adf29806a168fa75cca6e887b0a"
    end
  end

  def install
    bin.install "bssh-keygen"
    man1.install "bssh-keygen.1"
  end

  test do
    output = shell_output("#{bin}/bssh-keygen --version")
    assert_match(/bssh-keygen\s+#{version}/, output)
  end
end
