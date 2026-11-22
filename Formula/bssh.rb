class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v3.1.3/bssh-macos-aarch64.zip"
      sha256 "d705a3a1b9596f5b2c527cc348f3b3455ad325341e867dee30c661e4687eae2f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v3.1.3/bssh-linux-aarch64.tar.gz"
      sha256 "66f7575edd02902082ba2db21144b15b37b673af8f62ba984f76fa83adb63f9b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/bssh/releases/download/v3.1.3/bssh-linux-x86_64.tar.gz"
      sha256 "48f6c99720a6ffe5960fbca57ae719db1153cb97add520482d97d42511c56880"
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
