class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/lablup/all-smi"
  version "0.20.0"
  license   "Apache-2.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.20.0/all-smi-macos-aarch64.zip"
      sha256 "0fcd30883b9d9f75b87b7d881fc6a9be38959fdbff31c3d130435ff8a136304a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.20.0/all-smi-linux-aarch64.tar.gz"
      sha256 "3ce58e46a1c6f8fa095255ddd68f6335b1a397fbcf8bec65cfe58ff1a1290fd1"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.20.0/all-smi-linux-x86_64.tar.gz"
      sha256 "5a244e2a154c5faf2eec74d04bbf2d40e00884d7678262374e3e8e2c463b0916"
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
