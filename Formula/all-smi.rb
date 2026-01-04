class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/lablup/all-smi"
  version "0.15.2"
  license   "Apache-2.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.15.2/all-smi-macos-aarch64.zip"
      sha256 "4ee65197deb2d9d5fbb6773f35b1303c7d83e73e379e570bd4e4072609635e4e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.15.2/all-smi-linux-aarch64.tar.gz"
      sha256 "a53dfd8019cfd80bf35a1037bca0b0c5fa12dc5db99cad74d63141f0ec658019"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.15.2/all-smi-linux-x86_64.tar.gz"
      sha256 "d6147ae31d5b5651542d4a204fe8d79fe37f6f30a7377bce5f80c9aefd317adb"
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
