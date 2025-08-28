class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "0.6.1"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v0.6.1/bssh-macos-aarch64.zip"
      sha256 "57560af12938b38215e755d62d1850237b5b7d2f0dc0b97b7c8146c1b24518b1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v0.6.1/bssh-linux-aarch64.tar.gz"
      sha256 "4e7e5a9524700e2be67a755931609613650279fc40b285d820fe08f58144a149"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v0.6.1/bssh-linux-x86_64.tar.gz"
      sha256 "963a98c61e6279a34bb7f8e33346bf8c199d62bfc34be2d5242737ccde0b42e9"
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
