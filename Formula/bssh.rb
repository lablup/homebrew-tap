class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "3.0.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v3.0.1/bssh-macos-aarch64.zip"
      sha256 "a2ee176fec6291f5f198a30e7cce71d0a3b6129b5bed8ee4fa5497e3639a31f6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v3.0.1/bssh-linux-aarch64.tar.gz"
      sha256 "b9ce12248267d9ffb8c77018eef22d6a9c9d028fd3d9f38f06eed187b48e226c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/bssh/releases/download/v3.0.1/bssh-linux-x86_64.tar.gz"
      sha256 "1214cd9e106c9a95e457545360ff9c9fec4873c6b029509472eb89fc07cc7ada"
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
