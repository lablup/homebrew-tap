class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/inureyes/all-smi"
  version   "0.6.0"
  license   "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.6.0/all-smi-macos-aarch64.zip"
      sha256  "7da999fb589a9bb4bd81027b8d5e7908ad5a88e2dbcb6e5d4c5e96b7dc597e01"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.6.0/all-smi-linux-aarch64.tar.gz"
      sha256   "411de920ba6d9a89891167ca2bca4c4cf57eb9965c82653c4f88a504c5c10ccb"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.6.0/all-smi-linux-x86_64.tar.gz"
      sha256   "432789a7c57377a8ffe07e297c6a141d39482d052b54ba7f200bcd72afa73895"
    end
  end

  def install
    bin.install "all-smi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/all-smi --version")
  end
end
