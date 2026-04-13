class BsshServer < Formula
  desc      "Lightweight SSH server for containers (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "2.0.0"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v2.0.0/bssh-server-macos-aarch64.zip"
      sha256 "0c53faa4e617ca996581e73260b26d610ded5ac05e99fccaff104d56c3fee74d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v2.0.0/bssh-server-linux-aarch64.tar.gz"
      sha256 "7b1809a5ec29be3c5132831710a1f3ee6fce4994e8af644cdfeee09f778001ca"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v2.0.0/bssh-server-linux-x86_64.tar.gz"
      sha256 "68c31554fa29a4e37421a90ecd7b894dce5d87fbdab375a1f953f10f901f9421"
    end
  end

  def install
    bin.install "bssh-server"
    man8.install "bssh-server.8"
  end

  test do
    output = shell_output("#{bin}/bssh-server --version")
    assert_match(/bssh-server\s+#{version}/, output)
  end
end
