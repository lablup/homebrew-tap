class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/lablup/all-smi"
  version "0.15.0"
  license   "Apache-2.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.15.0/all-smi-macos-aarch64.zip"
      sha256 "4260aab979d5ab4d68ef07c66b35fc440328a5980d58581768a75bea94f0957f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.15.0/all-smi-linux-aarch64.tar.gz"
      sha256 "add8967505ca5060b07c87e8be88e2b7c5df3bfcdaf7a349262609cd19f5008a"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.15.0/all-smi-linux-x86_64.tar.gz"
      sha256 "b202535198b6fa4137e13b95dc8875fe8bd510e866f4197f133b42cf73eded6d"
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
