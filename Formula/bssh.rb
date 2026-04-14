class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "2.0.1"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v2.0.1/bssh-macos-aarch64.zip"
      sha256 "f9bd0ff0f3f491adeb7fb9b9cc408afc86efa1d59c50fe2caf8c00210892c4cd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v2.0.1/bssh-linux-aarch64.tar.gz"
      sha256 "3a72951ab415ae15a9566478258efd42d8b1ba938a55e401e52e18c1e6d703b6"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v2.0.1/bssh-linux-x86_64.tar.gz"
      sha256 "a3ad633b7960df536adf7e5bbabc00743a92d89be5cf9248f60b480353a08164"
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
