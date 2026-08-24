class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "2.4.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v2.4.3/bssh-macos-aarch64.zip"
      sha256 "1e6543028f319a89023d674cea591ba7ec46667063c30aee1fbc3d3577b32d55"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v2.4.3/bssh-linux-aarch64.tar.gz"
      sha256 "ad552321375a3800c91ae66a866ea2afe11b963b6a7788562d4f64aa3a91ebca"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/bssh/releases/download/v2.4.3/bssh-linux-x86_64.tar.gz"
      sha256 "d948d44fa9402823ec0f0a641cdfa15ed567093604f7b2f776364734822cc980"
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
