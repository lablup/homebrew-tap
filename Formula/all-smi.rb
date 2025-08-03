class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/inureyes/all-smi"
  version "v0.7.0"
  license   "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.7.0/all-smi-macos-aarch64.zip"
      sha256 "f1fd4ef4a4b44061d2e645d1ebc3f63eb3410c986da708b508e6f92a179acf1f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.7.0/all-smi-linux-aarch64.tar.gz"
      sha256 "6e9cbd984792053ba9b41814fced0de9c745a05da0d47742993adb751c2e8ca3"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.7.0/all-smi-linux-x86_64.tar.gz"
      sha256 "bdd554b1841301eda6c6af5bd949669ac05262d5a13332ff45291a219a56a6df"
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
