class BsshKeygen < Formula
  desc      "SSH key generator utility for bssh (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "2.0.0"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v2.0.0/bssh-keygen-macos-aarch64.zip"
      sha256 "36c97e7bb3d62af754a712edfc482636da39b126f9b9312f760f2ed8390bdf27"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v2.0.0/bssh-keygen-linux-aarch64.tar.gz"
      sha256 "d5a268205a0d4e84c84fa5b56bae72c1f6b19bb4c2f219d534a5613c2a2e13d9"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v2.0.0/bssh-keygen-linux-x86_64.tar.gz"
      sha256 "e64d486080102d99a40078fa6afeecb57dbf03d0ffa843a917975350df936cd4"
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
