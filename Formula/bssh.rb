class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "0.4.0"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v0.4.0/bssh-macos-aarch64.zip"
      sha256 "201bef14fd31cdf7361eb750419ff27d6c4afde225f06987e652fea2251a91de"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v0.4.0/bssh-linux-aarch64.tar.gz"
      sha256 "aae7fce68772c7c84b50ae09d69a122e53dc6d03a5277791aed5c85661cdf29c"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v0.4.0/bssh-linux-x86_64.tar.gz"
      sha256 "0951011fe9a872ae3972b5b8630c111fde31d372cca78d33215b1612011b47d8"
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
