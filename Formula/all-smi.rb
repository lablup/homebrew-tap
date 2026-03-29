class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/lablup/all-smi"
  version "0.17.4"
  license   "Apache-2.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.17.4/all-smi-macos-aarch64.zip"
      sha256 "008a22035424d618514549593f41908c38d94571991679d32decb1700f568e15"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.17.4/all-smi-linux-aarch64.tar.gz"
      sha256 "662db2ce916c073cd6f5edaf6f25811ad35a228f5a66395ee7efea986a2b49f6"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.17.4/all-smi-linux-x86_64.tar.gz"
      sha256 "b1974f6320059557af60da65295e6eea83b6a54267363c6557287a030b99cfe5"
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
