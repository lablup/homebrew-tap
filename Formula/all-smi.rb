class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/lablup/all-smi"
  version "0.18.1"
  license   "Apache-2.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.18.1/all-smi-macos-aarch64.zip"
      sha256 "7100656d1f8ea6407c35fcf091b222c1a7de0e42dcae4f8abbb3931d83725c85"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.18.1/all-smi-linux-aarch64.tar.gz"
      sha256 "35d10fb38a6a61929e9cafdeb5c16106f3edf3eb887fdc7865e6f598ffda5892"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.18.1/all-smi-linux-x86_64.tar.gz"
      sha256 "5e6ea15fbd90acc214c215920c05f519b34b0545115642fb0b16bd7c1242282e"
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
