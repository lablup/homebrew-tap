class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/inureyes/all-smi"
  version   "0.6.3"
  license   "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.6.3/all-smi-macos-aarch64.zip"
      sha256  "6a3d8dc3ba0e8de92e6739f6ee2786f8cfed6bd9c629801d4d44cdfb2b910171"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.6.3/all-smi-linux-aarch64.tar.gz"
      sha256   "66fdbb7dc55e339e31c7970d31829d8e0cb03165df65cdc44fa849599fbaf484"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.6.3/all-smi-linux-x86_64.tar.gz"
      sha256   "9f4c6c6f44246578cfbe6410.6.338f4ac35e289369d13d0ceadc2ae07015c4e"
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
