class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/lablup/all-smi"
  version "0.21.0"
  license   "Apache-2.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.21.0/all-smi-macos-aarch64.zip"
      sha256 "1532f8f60d62b59ed1112120e117c34c6676f83f38600c8cb0350bd2d81d5852"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.21.0/all-smi-linux-aarch64.tar.gz"
      sha256 "ed495c636a506aa0a70a0e3dfb5fd90ce4fd5f9377ae8853e8784943a5b0945f"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.21.0/all-smi-linux-x86_64.tar.gz"
      sha256 "cb9de8fa4590e0974a4ff48842f2164f8b0ae4bdc7bc66ca181147c64ab42bb7"
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
