class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/lablup/all-smi"
  version "0.22.0"
  license   "Apache-2.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.22.0/all-smi-macos-aarch64.zip"
      sha256 "fffc44c075186d756c0eb3783c84a570a2feb275332ccc3bbcbeb020ad96e077"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.22.0/all-smi-linux-aarch64.tar.gz"
      sha256 "05b0ad9490e2a927e181062f980ed0d0457b31280fbacc75720ccc3407a4f14f"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.22.0/all-smi-linux-x86_64.tar.gz"
      sha256 "e2205df0defe8a2248476f6c0671e091883933dceab6805cbfcbd53882829526"
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
