class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/lablup/all-smi"
  version "0.20.1"
  license   "Apache-2.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.20.1/all-smi-macos-aarch64.zip"
      sha256 "f65c79baa22577bfc28d7a477b06c3ded17245863b7ccf1f25102b53cd07fd1b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.20.1/all-smi-linux-aarch64.tar.gz"
      sha256 "bb25a41ec7d6ee83f752ba6c3bf9211cdb4129849db7d6e611395686b66a28cf"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.20.1/all-smi-linux-x86_64.tar.gz"
      sha256 "9efd2461f7f60b0c456a27c262067178d1004de8babd0e601759dc7695d8bb64"
    end
  end

  def install
    bin.install "all-smi"
    man1.install "all-smi.1"
  end

  test do
    output = shell_output("#{bin}/all-smi --version")
    assert_match(/all-smi\s+#{version}/, output)
  end
end
