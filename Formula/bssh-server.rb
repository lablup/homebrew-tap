class BsshServer < Formula
  desc      "Lightweight SSH server for containers (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "2.1.4"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v2.1.4/bssh-server-macos-aarch64.zip"
      sha256 "7fcf6430aca7644d572fe7741e74f93836a3ae27c2679d24a85204f302f4196b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v2.1.4/bssh-server-linux-aarch64.tar.gz"
      sha256 "a3989caed0fc3691e1f4727d26277085e7c000fb1ea6824bf6b019287f5f7282"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v2.1.4/bssh-server-linux-x86_64.tar.gz"
      sha256 "3239892f5bcbc554c48f859ce06e39d74db4bf029b6cb6b8f9feefce02cf4e95"
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
