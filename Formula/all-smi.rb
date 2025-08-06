class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/inureyes/all-smi"
  version "0.7.1"
  license   "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.7.1/all-smi-macos-aarch64.zip"
      sha256 "7f057da419cb9a1ea45766c485f32e042c0cdb62e2fe50d7c07cc8a6082caf21"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.7.1/all-smi-linux-aarch64.tar.gz"
      sha256 "19b3ff4976dc3a80c55497687e5f84ae075788eb2abe536fb45f6f308bebb9ff"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.7.1/all-smi-linux-x86_64.tar.gz"
      sha256 "e15b1ff1b59533d990cc70bb8f16dde05a48ead9cc2df1b0b115f14db593a80f"
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
