class BsshKeygen < Formula
  desc      "SSH key generator utility for bssh (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "2.2.3"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v2.2.3/bssh-keygen-macos-aarch64.zip"
      sha256 "19e7256a0c59834ddb14623b66b5ea7d50f419abed4eb8f0f5aa3f53bd02f15b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v2.2.3/bssh-keygen-linux-aarch64.tar.gz"
      sha256 "3d260364a9e34c08ee0f2d097198dd64582ce833027bf078eb559afd2d3ad3a0"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v2.2.3/bssh-keygen-linux-x86_64.tar.gz"
      sha256 "6307c16a5ea17883a1da04cd0c707d9afead014190e4050526af7dc644d4c411"
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
