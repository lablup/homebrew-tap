class BsshServer < Formula
  desc      "Lightweight SSH server for containers (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "2.4.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v2.4.2/bssh-server-macos-aarch64.zip"
      sha256 "fb8a32025a70ba245d5a8e871f40699f0cddfb0bdcf42288404bdbe5593cab87"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v2.4.2/bssh-server-linux-aarch64.tar.gz"
      sha256 "d77413fb68cf65760132372da6c098aca9a2eecb7c4c1f3ae2261684632a404e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/bssh/releases/download/v2.4.2/bssh-server-linux-x86_64.tar.gz"
      sha256 "dcfa37fa4116fba8f9b34d944626314e9016d39666098116b040fd9622177890"
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
