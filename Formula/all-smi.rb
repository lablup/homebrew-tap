class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/inureyes/all-smi"
  version "0.7.2"
  license   "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.7.2/all-smi-macos-aarch64.zip"
      sha256 "311620f019637ee0f9aed4f9f557c75e936aa94527f4f0b7cdd9f9c570c2c989"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.7.2/all-smi-linux-aarch64.tar.gz"
      sha256 "6093b5c13bcebe628006953f7d9e89cfd616db8d5661502d3aa6a4916fe98afa"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.7.2/all-smi-linux-x86_64.tar.gz"
      sha256 "ec5b2108d3e29fed92af1daeec3827e3ca0e0cc9a00a673259f9df2910fe5ba0"
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
