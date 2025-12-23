class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/lablup/all-smi"
  version "0.13.1"
  license   "Apache-2.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/all-smi/releases/download/v0.13.1/all-smi-macos-aarch64.zip"
      sha256 "744f09e7c503ad24fc620c0b4b6acc426ceb5e7c50f58c92803b8d325aab705e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/all-smi/releases/download/v0.13.1/all-smi-linux-aarch64.tar.gz"
      sha256 "69ae201723e15136219e6f4464992ccd5754d19a0bc5f31bdf7d6e80b8591379"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/all-smi/releases/download/v0.13.1/all-smi-linux-x86_64.tar.gz"
      sha256 "96fa87a15ad362d5f51a2e66303046e518048e12ef24f3b78025e470f5851c82"
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
