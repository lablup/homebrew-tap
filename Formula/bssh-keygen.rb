class BsshKeygen < Formula
  desc      "SSH key generator utility for bssh (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "2.4.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v2.4.1/bssh-keygen-macos-aarch64.zip"
      sha256 "f28ca9ab42977d83b83104ac4a76559502b750dcde88089377a84f9f4a887e93"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v2.4.1/bssh-keygen-linux-aarch64.tar.gz"
      sha256 "8c79861822256020c3aeb0b16a49d09c836db5eeb341c0a9e63ae8983ee9c7f5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/bssh/releases/download/v2.4.1/bssh-keygen-linux-x86_64.tar.gz"
      sha256 "afbc24b59012832b3e3c8bcb2dc638ce4ddfcf0a32eeeb73ac010793213d15ac"
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
