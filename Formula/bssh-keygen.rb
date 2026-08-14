class BsshKeygen < Formula
  desc      "SSH key generator utility for bssh (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "2.4.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v2.4.2/bssh-keygen-macos-aarch64.zip"
      sha256 "058f410813223a42eb80c296ba4570d99e7e13fd7ce4f8b71c421d50c50999ec"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v2.4.2/bssh-keygen-linux-aarch64.tar.gz"
      sha256 "b446941c34d320dbe3e57c8733cfb1c2347a2f15379295960eaff67c297e018a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/bssh/releases/download/v2.4.2/bssh-keygen-linux-x86_64.tar.gz"
      sha256 "4d8f29fafc870ae42c2a7e74e175ec759787934ef32af6205b1c025773f35536"
    end
  end

  def install
    bin.install "bssh-keygen"
    man1.install "bssh-keygen.1"
  end

  test do
    output = shell_output("#{bin}/bssh-keygen --version")
    assert_match(/bssh-keygen\s+#{version}/, output)
  end
end
