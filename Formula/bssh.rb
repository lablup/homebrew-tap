class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "2.4.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v2.4.2/bssh-macos-aarch64.zip"
      sha256 "f65c80bfbbc8e33d697e981193c847685d191e0f0f7b370eb9c6625aec3c3b0a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v2.4.2/bssh-linux-aarch64.tar.gz"
      sha256 "f3991391d83a2bfa1e45fee3248811ea933668f774ee10b23d7da86e9c352cf4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/bssh/releases/download/v2.4.2/bssh-linux-x86_64.tar.gz"
      sha256 "4c8e6b35a3ef070e1ef132b6830539518e10763437e20002061075d3d56c275b"
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
