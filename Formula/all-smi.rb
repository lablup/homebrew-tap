class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Apple Silicon/Jetson"
  homepage  "https://github.com/inureyes/all-smi"
  version   "0.4.1"
  license   "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.4.1/all-smi-macos-aarch64.tar.gz"
      sha256  "bf26cc9b351183e39f77bc25a9b885245557695e5066e8899d4adca623aca850"
    end
  end

  on_linux do
    url      "https://github.com/inureyes/all-smi/releases/download/v0.4.1/all-smi-linux-x86_64.tar.gz"
    sha256   "933512d5d3ba68e911ff1540c07edae0e21bff7b6647efec62e765f2a7465332"
  end

  def install
    bin.install "all-smi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/all-smi --version")
  end
end