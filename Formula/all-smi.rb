class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/lablup/all-smi"
  version "0.17.2"
  license   "Apache-2.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.17.2/all-smi-macos-aarch64.zip"
      sha256 "83193a4d6b549fc03dd04d71e4eba794ce679910ef367587a837bfb50731bcb1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.17.2/all-smi-linux-aarch64.tar.gz"
      sha256 "2ce53def5094b4627340031e85f520d061aab6bebfc13e370a2df8d571704306"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.17.2/all-smi-linux-x86_64.tar.gz"
      sha256 "8240ba520e5469c3d476ef916deb7d77f6b85f26fca7db24fc515a71a1c0c6eb"
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
