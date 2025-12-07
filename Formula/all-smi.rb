class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/inureyes/all-smi"
  version "0.12.0"
  license   "Apache-2.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.12.0/all-smi-macos-aarch64.zip"
      sha256 "541927ba06bd986e637f9212fe795cbb6bd8538eba2579c793fd3ab4f8c33565"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.12.0/all-smi-linux-aarch64.tar.gz"
      sha256 "b8169913cf706496d4eee8049b2d60ff1f895ae814f35ed3790a2f62995ed7c2"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.12.0/all-smi-linux-x86_64.tar.gz"
      sha256 "e70b29189f267178773697fdf4096c7ff85d3f8ce4414f6d878dbe6d39592638"
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
