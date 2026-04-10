class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/lablup/all-smi"
  version "0.19.0"
  license   "Apache-2.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.19.0/all-smi-macos-aarch64.zip"
      sha256 "4b3203740246c31a95eb99efde679ca4c5c3906d76f102ca4272a33b89c6e047"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.19.0/all-smi-linux-aarch64.tar.gz"
      sha256 "221bf93d3974e01513796e5b06cd5d7d428de27563da54dcdacd88fe19f22e2d"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.19.0/all-smi-linux-x86_64.tar.gz"
      sha256 "697120ffe2c82c62cdba21a84a6fdc8b4ef770acab475ab0995a851686297d13"
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
