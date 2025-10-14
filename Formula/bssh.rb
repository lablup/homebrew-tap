class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "0.9.1"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v0.9.1/bssh-macos-aarch64.zip"
      sha256 "fbe0a59aea5fc99b6eb380c088f8772bda281be2b81d21c17cc734e52ce94fef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v0.9.1/bssh-linux-aarch64.tar.gz"
      sha256 "4027bdf242db572f12e638b5623fc577c1f69062410febfbf5484172a3029c7e"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v0.9.1/bssh-linux-x86_64.tar.gz"
      sha256 "a2689938c6f49d8417cfc3d8efd39bd682354cea3861871ae7080fef3da5f840"
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
