class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "1.4.0"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v1.4.0/bssh-macos-aarch64.zip"
      sha256 "342214ccd303cd8e7c19c86e15e94ec6aec8147cc8503b06a3c79df10a298012"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v1.4.0/bssh-linux-aarch64.tar.gz"
      sha256 "1154c0957dbefd8f15b62f7712d675c13185837691271754f727042edb17ea3a"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v1.4.0/bssh-linux-x86_64.tar.gz"
      sha256 "097a7096eae1e75dc8a85b5af0fbfbcee23380cc64e13b7c482a2d4f32f95328"
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
