class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "1.6.0"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v1.6.0/bssh-macos-aarch64.zip"
      sha256 "c72a9d9549bf8cf7075202b869518078ea39fbac5acddc4e5c7e3e4bcd5f8aca"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v1.6.0/bssh-linux-aarch64.tar.gz"
      sha256 "7c6d15d193836151df6229a4304069503ba3594b40bd64b9c5824c4367dec1b4"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v1.6.0/bssh-linux-x86_64.tar.gz"
      sha256 "bc8181de1a57f914d8e98006de665cf4de7c512a3fbd19ebfceed5e0f8fe48b3"
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
