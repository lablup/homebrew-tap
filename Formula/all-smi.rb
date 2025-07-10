class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Apple Silicon/Jetson"
  homepage  "https://github.com/inureyes/all-smi"
  version   "0.4.2"
  license   "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.4.2/all-smi-macos-aarch64.zip"
      sha256  "eb1eda8fccf88990bedc7ea7de4eb464770f38e70119a60e9d167d635e3becca"
    end
  end

  on_linux do
    url      "https://github.com/inureyes/all-smi/releases/download/v0.4.2/all-smi-linux-x86_64.tar.gz"
    sha256   "9f4a2a8f365b452e38fc3b33907d0db9bd8ef27ce62c90178de13471284e7f5d"
  end

  def install
    bin.install "all-smi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/all-smi --version")
  end
end
