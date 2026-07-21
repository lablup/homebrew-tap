class BsshKeygen < Formula
  desc      "SSH key generator utility for bssh (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "2.3.0"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v2.3.0/bssh-keygen-macos-aarch64.zip"
      sha256 "09cf47b0f023995a551796731d9f2d40bdfca30f6cc6050c369df94195b8aca9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v2.3.0/bssh-keygen-linux-aarch64.tar.gz"
      sha256 "1ca5e971dfba25f3bbc11fc0703bc3b3c380c8e2e7b77c698c5c6d52262425f4"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v2.3.0/bssh-keygen-linux-x86_64.tar.gz"
      sha256 "fcfc49091d12c3b5e611ddae0b1503e729c17c31255baea16aa5a6884c41e852"
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
