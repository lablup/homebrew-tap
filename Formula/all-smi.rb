class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/lablup/all-smi"
  version "0.21.1"
  license   "Apache-2.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.21.1/all-smi-macos-aarch64.zip"
      sha256 "fb6a524a78587cbb642e291e66424c4177d735108ca584579457495ce55ab40a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.21.1/all-smi-linux-aarch64.tar.gz"
      sha256 "5fcda93024438b0e58980c0f7e4ea0c9c11396b8e8bcfc868c4fac5db3236fa3"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.21.1/all-smi-linux-x86_64.tar.gz"
      sha256 "109b37e75999c12aa27844f28d7fe479feae3816ee5d765d4d0ac422a2d1e8fa"
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
