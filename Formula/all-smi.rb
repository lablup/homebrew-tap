class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/inureyes/all-smi"
  version "0.11.0"
  license   "Apache-2.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.11.0/all-smi-macos-aarch64.zip"
      sha256 "8b0c330d41a4766cf2a8ea45ce9c2847d50596f50b2401e7c3cae7449e5e81e3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.11.0/all-smi-linux-aarch64.tar.gz"
      sha256 "20601cd61d48222cef8dd7c16f68622a3684c65f44adcec88bd725fffc8d8596"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.11.0/all-smi-linux-x86_64.tar.gz"
      sha256 "a6507522188c7a75e86cd73c7d7c19c4d4604d4af529b3fbd1377ae4805bbdb3"
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
