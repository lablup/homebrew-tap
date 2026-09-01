class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "3.0.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v3.0.0/bssh-macos-aarch64.zip"
      sha256 "1a4d94e6dbbfa738382f676dd48dd3474b3c40d23368ab1c26fa3b32ccea9fa4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v3.0.0/bssh-linux-aarch64.tar.gz"
      sha256 "d50834fe7755b36eaf431f656400fb675f4262c16cdd1da9cdd6eb2cffb41c89"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/bssh/releases/download/v3.0.0/bssh-linux-x86_64.tar.gz"
      sha256 "b9f4cf7d8e6010514cffa3644053dc70e3e39aef54c8febb4e48efa00cb7b32e"
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
