class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/inureyes/all-smi"
  version "0.7.0"
  license   "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.7.0/all-smi-macos-aarch64.zip"
      sha256 "1ffa8b1a573bcbd02f287d6822a0d1fa5a2ce049413bd0c4af6796f3f4a0ba64"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.7.0/all-smi-linux-aarch64.tar.gz"
      sha256 "c6895cfc2f8031c646c87f742f66e6ff50727128736e7bf1cf72103763a48a04"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.7.0/all-smi-linux-x86_64.tar.gz"
      sha256 "cd1981f3b55e7e1c01f74b3f1904bb9c36fb86dd1aa2297f07fcb03342f61aeb"
    end
  end

  def install
    bin.install "all-smi"
  end

  test do
    output = shell_output("#{bin}/all-smi --version")
    assert_match(/all-smi\s+#{version}/, output)
  end
end
