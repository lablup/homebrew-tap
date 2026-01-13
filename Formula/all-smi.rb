class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/lablup/all-smi"
  version "0.17.0"
  license   "Apache-2.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.17.0/all-smi-macos-aarch64.zip"
      sha256 "e42fd52716c4553648ccaa08e4ea7f1f389986b56340d50f27c040f66cf90915"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.17.0/all-smi-linux-aarch64.tar.gz"
      sha256 "04292a268cfe8070166eb9ee071ccf4a92c96358ccfa2f2f0151d44abfea4f86"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.17.0/all-smi-linux-x86_64.tar.gz"
      sha256 "207cbe363e52ca5aa1870c953402add4da50247349d3b6bb3399dc6aba1b8b52"
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
