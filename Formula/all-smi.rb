class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/lablup/all-smi"
  version "0.24.0"
  license   "Apache-2.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.24.0/all-smi-macos-aarch64.zip"
      sha256 "7d45506c9531e459d946fb06e5a602b94f12ea33e405d0ba2e57beb4baa89afa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.24.0/all-smi-linux-aarch64.tar.gz"
      sha256 "3f05d95f465e2078457e873145106361532ccd22c1c162b5fb27fc413fe9f338"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.24.0/all-smi-linux-x86_64.tar.gz"
      sha256 "3fcbba1e9dc82b510360961ca3ba87d7726fdd97016c26a536eab9066afa5f09"
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
