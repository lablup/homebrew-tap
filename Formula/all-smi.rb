class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/inureyes/all-smi"
  version "0.10.0"
  license   "Apache-2.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.10.0/all-smi-macos-aarch64.zip"
      sha256 "886f220448467e2f3bbf4e0d58d633a7da5d7c5249b9f94131c3bd4313d46442"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.10.0/all-smi-linux-aarch64.tar.gz"
      sha256 "9bfe133b3413b851643c4ec5ee7a78d9e3c57f7f5b834657439eb83a1dc0a643"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.10.0/all-smi-linux-x86_64.tar.gz"
      sha256 "ed40deefe6e0177116f521d77f09c9ebd6d9e1435eb7e9a0c4f16be9a0f5ea32"
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
