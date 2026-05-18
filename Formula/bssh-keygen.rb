class BsshKeygen < Formula
  desc      "SSH key generator utility for bssh (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "2.2.0"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v2.2.0/bssh-keygen-macos-aarch64.zip"
      sha256 "510a26c389b31082b522aca790311763d108943bad38d224254996e9846c116b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v2.2.0/bssh-keygen-linux-aarch64.tar.gz"
      sha256 "a77c373f113840acd90c6196cadd888720b7fa5636d1bf92efb8939f6d447470"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v2.2.0/bssh-keygen-linux-x86_64.tar.gz"
      sha256 "daec123912d8943976003d9a11831a83608acf48611e4c80c08c61fc4d0c72e6"
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
