class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/lablup/all-smi"
  version "0.18.0"
  license   "Apache-2.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.18.0/all-smi-macos-aarch64.zip"
      sha256 "f0bdd39550d94ff313b845a747adfc63120465186fa155f0558f9af7cf5b7260"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.18.0/all-smi-linux-aarch64.tar.gz"
      sha256 "0c8ca170c9d2563a578bed4332a6131fd53743d8c962e7caa8a0ca04b8fa18a7"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.18.0/all-smi-linux-x86_64.tar.gz"
      sha256 "c29fb1106542be238145bbf757837b4b86ddfcf4780e00a94d113beec497288c"
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
