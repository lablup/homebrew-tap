class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "2.2.1"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v2.2.1/bssh-macos-aarch64.zip"
      sha256 "77a992dd61d27499ab578aae22e3ec6e86fa70a3df5227ebd552d52580a6d91b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v2.2.1/bssh-linux-aarch64.tar.gz"
      sha256 "2dbcb19d6b3271b7515a066500676fb0030d3bdf281af0c337c62688805157bf"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v2.2.1/bssh-linux-x86_64.tar.gz"
      sha256 "d3129ec29292e99ed51e59206408ed1f92e61034ed50c6b521a6fe9f0febc841"
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
