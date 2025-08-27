class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "0.5.4"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v0.5.4/bssh-macos-aarch64.zip"
      sha256 "6ee3824d5119b5bb6e3db1b53069d9788f2769b3c0d4c4c49da03d0b46175049"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v0.5.4/bssh-linux-aarch64.tar.gz"
      sha256 "922a6aa8630628f184866637fb0770481fe205e049aba3ff64c666eaa3fc36cf"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v0.5.4/bssh-linux-x86_64.tar.gz"
      sha256 "6d65c5cc25dc8f1e7ad1f83e5c094cbe910e432ef4f91ddd84ba982bdd737da5"
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
