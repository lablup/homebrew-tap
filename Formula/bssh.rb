class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "0.6.0"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v0.6.0/bssh-macos-aarch64.zip"
      sha256 "4ebd77dca43925a7efdbe4a7ee90516275a3059ffe00d7516fb4ad9587ab5165"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v0.6.0/bssh-linux-aarch64.tar.gz"
      sha256 "42e6111ddaa07102ef2432324f8a3d3873c8b0e272bccc2be72df95cad9e3d14"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v0.6.0/bssh-linux-x86_64.tar.gz"
      sha256 "fbb7dd94e2f332fe2da7fabc05c0d4c89fda71dd355360e1f24aaebf3442a2b6"
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
