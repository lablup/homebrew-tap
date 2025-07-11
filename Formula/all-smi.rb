class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Apple Silicon/Jetson"
  homepage  "https://github.com/inureyes/all-smi"
  version   "0.5.0"
  license   "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.5.0/all-smi-macos-aarch64.zip"
      sha256  "26f7ea44358a7c5afc2c3d43bc9375cc42e655d74b935fc794d5342a7b5103f6"
    end
  end

  on_linux do
    url      "https://github.com/inureyes/all-smi/releases/download/v0.5.0/all-smi-linux-x86_64.tar.gz"
    sha256   "25c522434f0d1d2f97e6cbf5ce82a8ea9e27ee330d25f8cc6a3f5a832b53c760"
  end

  def install
    bin.install "all-smi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/all-smi --version")
  end
end
