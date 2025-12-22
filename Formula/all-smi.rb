class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/inureyes/all-smi"
  version "0.13.0"
  license   "Apache-2.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.13.0/all-smi-macos-aarch64.zip"
      sha256 "b6ec6c60e81a0510239755047a3f0a583142af295fb3c2221a01283a1f879596"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.13.0/all-smi-linux-aarch64.tar.gz"
      sha256 "268ca2022e9b7c76d163334138abdc2edf217f84faeea89fa114b886d101ba3e"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.13.0/all-smi-linux-x86_64.tar.gz"
      sha256 "975b1abcaf16e143ddf9dd712ee3e987f7926e3bcc28b3e6e1c13f9ca2ffd01c"
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
