class BsshKeygen < Formula
  desc      "SSH key generator utility for bssh (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "2.1.3"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v2.1.3/bssh-keygen-macos-aarch64.zip"
      sha256 "604310bd21b5e54688d212b783d60fbcd2369c3eac9810e1887215ded99a0a87"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v2.1.3/bssh-keygen-linux-aarch64.tar.gz"
      sha256 "09c4a5a05148ed7eb3bc8966c276b782af670c81c998bd96cceee9c8f74c9cd5"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v2.1.3/bssh-keygen-linux-x86_64.tar.gz"
      sha256 "3902c11677750d81abf0d41eaf28433f9e893a521cd4916e93ac4aeafee2c252"
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
