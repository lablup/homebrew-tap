class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "0.5.0"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v0.5.0/bssh-macos-aarch64.zip"
      sha256 "96de016cb3eef8259d44562c6e6c42d6ac09bac52082882916189905ebc601f8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v0.5.0/bssh-linux-aarch64.tar.gz"
      sha256 "7e7e094ed5c70ac06b3701c5598daf2f1f492400f47a86fa2e765f8cb4c94f6a"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v0.5.0/bssh-linux-x86_64.tar.gz"
      sha256 "728f884bf71a9c57ea8ab6804e4bf35eaf2db074484e26d45641c5da1e51e2a4"
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
