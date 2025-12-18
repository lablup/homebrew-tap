class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "1.5.0"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v1.5.0/bssh-macos-aarch64.zip"
      sha256 "992ec67c43c2a52d72493236cdf66e8c23cade1fc0f4d7509e30d1cbe938cf3f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v1.5.0/bssh-linux-aarch64.tar.gz"
      sha256 "55bf8be71bebba149c1ebdd159c399d1cd2b722586bfbe4531124f95c1564cdb"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v1.5.0/bssh-linux-x86_64.tar.gz"
      sha256 "d65dddcbe636eb27adb8eb947a94d903736e89a5cd745accb540f95116e88046"
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
