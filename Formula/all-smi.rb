class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/lablup/all-smi"
  version "0.23.0"
  license   "Apache-2.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.23.0/all-smi-macos-aarch64.zip"
      sha256 "5dc5e3b6ee9ec5e91d976d5d5b769702c93bda78bacd05495fe3583121befdf5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.23.0/all-smi-linux-aarch64.tar.gz"
      sha256 "78005375ceb923f5b751eb9879bfcc5a6d3421705b95fb9ea74c51df70bf83a6"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.23.0/all-smi-linux-x86_64.tar.gz"
      sha256 "99363975efd8531edfb59b99e1a9aa1e6672cfd447fd67173a255bef6b9393f6"
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
