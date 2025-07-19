class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/inureyes/all-smi"
  version   "0.6.1"
  license   "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.6.1/all-smi-macos-aarch64.zip"
      sha256  "498cc07576eee1a60b5ec18fb766717747b04c4dff77ee47b842087cf69a5452"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.6.1/all-smi-linux-aarch64.tar.gz"
      sha256   "bf65d8ddd34d20cb79e7967eaf2f6855fec9623a7fd94996e8cf6cd91929f98a"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.6.1/all-smi-linux-x86_64.tar.gz"
      sha256   "bdba86d1c0c258291b38c492b0808f77ea76c7e1ab072fb751783c3dde8103d3"
    end
  end

  def install
    bin.install "all-smi"
  end

  test do
    output = shell_output("#{bin}/all-smi --version")
    assert_match(/all-smi\s+#{version}/, output)
  end
end
