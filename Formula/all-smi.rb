class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/lablup/all-smi"
  version "0.24.1"
  license   "Apache-2.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.24.1/all-smi-macos-aarch64.zip"
      sha256 "7fae7e559914ac80e2dbfda0860a710398c42b862b51001d55061f12104cc2a3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.24.1/all-smi-linux-aarch64.tar.gz"
      sha256 "49b47fade26870d9ec905d35e766f088cdb77869632313fc84553c6d0230ba97"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.24.1/all-smi-linux-x86_64.tar.gz"
      sha256 "905a64684041a223c9521a867e2486a1a0050e2adb9dea89a43ba05907ad33aa"
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
