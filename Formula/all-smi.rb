class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/inureyes/all-smi"
<<<<<<< HEAD
  version "0.8.0"
  license   "MIT"
=======
  version "0.7.1"
  license   "Apache-2.0"
>>>>>>> 84f74d6 (add: bssh)

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.8.0/all-smi-macos-aarch64.zip"
      sha256 "ed77533f1a6665caaa4dce5c10e06cfcbf9e017d1c715b98c62e4fb00af0a28f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.8.0/all-smi-linux-aarch64.tar.gz"
      sha256 "a190aa814ecbe58112c1b96e7036d5b25da0652d39819dd3047a33cfdf59abdd"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.8.0/all-smi-linux-x86_64.tar.gz"
      sha256 "f024dd8dbb91a93b8624c4f9aaddd436ed5d81fc58d9e391178755b2d870d009"
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
