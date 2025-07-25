class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/inureyes/all-smi"
  version   "0.6.2"
  license   "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.6.2/all-smi-macos-aarch64.zip"
      sha256  "4ee12a4c53ba01da5d24ebe8f68136babcaec5441fa988c59abdcd1b803dd091"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.6.2/all-smi-linux-aarch64.tar.gz"
      sha256   "d0b7325045cfdf17fd44a68d3b8477cb3a9a2c74301f0aa9f514e03b90097af9"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.6.2/all-smi-linux-x86_64.tar.gz"
      sha256   "3f9426dc7f44dd1609b4bd5955b7fa5f73607a8f40df6c7a400b036c629031f8"
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
