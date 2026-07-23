class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "2.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v2.3.0/bssh-macos-aarch64.zip"
      sha256 "62c7e931f60e5dddc893a638a0117a6e0989e2a9b292685660f55283a405b278"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v2.3.0/bssh-linux-aarch64.tar.gz"
      sha256 "329dad8677fa436ed94c0e8c007e44017d66c6c7c4b695226a6715bc7ff98668"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/bssh/releases/download/v2.3.0/bssh-linux-x86_64.tar.gz"
      sha256 "58371dd926b1b259575f0e47c36a005409e76b496eb0cdcdfee2160c27fda073"
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
