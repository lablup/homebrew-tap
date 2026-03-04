class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/lablup/all-smi"
  version "0.17.3"
  license   "Apache-2.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.17.3/all-smi-macos-aarch64.zip"
      sha256 "1d52f6606c53eaa131884505ccf1e2d3905034e3b19229094a18d70fb87c7975"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.17.3/all-smi-linux-aarch64.tar.gz"
      sha256 "52f3b1bc3c7982f4dc5b641cf815e6874202aa85bae15f9d826e4a5db80d6581"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.17.3/all-smi-linux-x86_64.tar.gz"
      sha256 "034ae66505b90eb36a6f7190faa9b906c21831a1b281a4bdb93327b514b9d6ed"
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
