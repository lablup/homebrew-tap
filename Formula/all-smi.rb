class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/lablup/all-smi"
  version "0.17.6"
  license   "Apache-2.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.17.6/all-smi-macos-aarch64.zip"
      sha256 "520081109610c9177da1325b4091474046955bbda3db6a311df89ea0a3ad6829"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.17.6/all-smi-linux-aarch64.tar.gz"
      sha256 "75dab1d73fc967e24afd0aa89f8416f769cad4a651b69b9ea5862b00ee79a403"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.17.6/all-smi-linux-x86_64.tar.gz"
      sha256 "497e864021e248bfde0d05cb5080c9126e33c18121ff26b6a03adba09c794d76"
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
