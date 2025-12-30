class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/lablup/all-smi"
  version "0.15.1"
  license   "Apache-2.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.15.1/all-smi-macos-aarch64.zip"
      sha256 "66618f45c7466cfb48104b9d3daf020b65579790f88071b8386d113ac7b69607"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.15.1/all-smi-linux-aarch64.tar.gz"
      sha256 "0ab8ddbd934f372a938f1e3220ed106c92268ecda2b54f9da18fc9684895598b"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.15.1/all-smi-linux-x86_64.tar.gz"
      sha256 "0d9b7dd1ce3500d642c8cda642027cd722867db2e3c7741cf8f0a6f2d397b555"
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
