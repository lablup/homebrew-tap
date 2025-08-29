class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/inureyes/all-smi"
  version "0.9.0"
  license   "Apache-2.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.9.0/all-smi-macos-aarch64.zip"
      sha256 "d36fc8af7a00a5f6876b912957fba873d30583c498efdd1220559e0efc0b14c9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.9.0/all-smi-linux-aarch64.tar.gz"
      sha256 "6aa678c625cdfe3b6af9698cc50dffb54754c9a067f4e44059c5c2472444f578"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.9.0/all-smi-linux-x86_64.tar.gz"
      sha256 "9ef41080dc1865916b00c3e55b096634233c52baa19ba222f26dd1ef1e3222bc"
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
