class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/lablup/all-smi"
  version "0.14.0"
  license   "Apache-2.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.14.0/all-smi-macos-aarch64.zip"
      sha256 "3f45f1c954d10f0f857ec0ba8e3877d0376ef7f7378d0790f2bd8ff44a5aed3b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.14.0/all-smi-linux-aarch64.tar.gz"
      sha256 "cd2b78c07af01a527f3ac0b7a2f3a485a52f0532148b4371fc035ab73681b0e0"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.14.0/all-smi-linux-x86_64.tar.gz"
      sha256 "f6b74431f58113b10fe5a62b0d4ca302b5147f3dfc05ddbd7ded4dea4f38e1af"
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
