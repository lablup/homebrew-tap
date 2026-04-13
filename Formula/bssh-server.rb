class BsshServer < Formula
  desc      "Lightweight SSH server for containers (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "2.0.0"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v2.0.0/bssh-server-macos-aarch64.zip"
      sha256 "0dc9b9ad00b27ae7dd1267fab433a0fb5059d958d6051ac3298817a1201776bc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v2.0.0/bssh-server-linux-aarch64.tar.gz"
      sha256 "768b01fe874ed039718906facfd23b8b1ffa56bb1fa266420ffa1634d5f7bfe3"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v2.0.0/bssh-server-linux-x86_64.tar.gz"
      sha256 "bd8f34d9d71516a0e288ae41499154957458801e80b4f60e91f5f9a132d94938"
    end
  end

  def install
    bin.install "bssh-server"
  end

  test do
    output = shell_output("#{bin}/bssh-server --version")
    assert_match(/bssh-server\s+#{version}/, output)
  end
end
