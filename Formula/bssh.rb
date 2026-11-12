class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "3.1.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v3.1.2/bssh-macos-aarch64.zip"
      sha256 "3036003fb9705f84d0ef4370a31e544ae897352aac57c61cde63c6e7724cb997"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v3.1.2/bssh-linux-aarch64.tar.gz"
      sha256 "38b5c51ffaa53d6b72ba98e7ba3e9f10ed2e260ba0f5013817a0a087e741b0e3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/bssh/releases/download/v3.1.2/bssh-linux-x86_64.tar.gz"
      sha256 "4475dd46a1a5d89e1c88741ac12a70e7df101a56f452989960f03a576d940cc4"
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
