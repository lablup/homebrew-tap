class BsshKeygen < Formula
  desc      "SSH key generator utility for bssh (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "3.0.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v3.0.0/bssh-keygen-macos-aarch64.zip"
      sha256 "59cd6e355a9152cd98fe797e418cfe628a49882d6af1e87eb7661c7294b15107"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v3.0.0/bssh-keygen-linux-aarch64.tar.gz"
      sha256 "9b68be0d7bc251a8fafdcaffe5efc14c38796374c015eccfbdac9cd498e8676d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/bssh/releases/download/v3.0.0/bssh-keygen-linux-x86_64.tar.gz"
      sha256 "a7484a1f372a6ff53fd1808f662d037b22d7010485ffea96bc2ce17765f47d20"
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
