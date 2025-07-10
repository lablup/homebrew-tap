class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Apple Silicon/Jetson"
  homepage  "https://github.com/inureyes/all-smi"
  version   "0.4.3"
  license   "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.4.3/all-smi-macos-aarch64.zip"
      sha256  "48529c5e0c591149897845f6b50a26041575a5bbd7f8407c7b5b2d82221da174"
    end
  end

  on_linux do
    url      "https://github.com/inureyes/all-smi/releases/download/v0.4.3/all-smi-linux-x86_64.tar.gz"
    sha256   "2823959fc9a59bcf0c0c9b0a98bc7789cd86b2c49c3e299dd748261ecd6e2300"
  end

  def install
    bin.install "all-smi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/all-smi --version")
  end
end
