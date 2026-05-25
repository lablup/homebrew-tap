class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "2.2.2"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v2.2.2/bssh-macos-aarch64.zip"
      sha256 "d83c1e689d17d33f0e469c1f34e370713f8428e2fcbaafc4653f18b88a2676c7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v2.2.2/bssh-linux-aarch64.tar.gz"
      sha256 "66b2105c1c99559cc56a7a176feda37881f7b4841e6c0ac0df1794448735e3f6"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v2.2.2/bssh-linux-x86_64.tar.gz"
      sha256 "9a6ebe56ee4cf41cb4793b30cee4325da615968864af88c9141a421f72c3a956"
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
