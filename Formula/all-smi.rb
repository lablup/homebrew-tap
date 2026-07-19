class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/lablup/all-smi"
  version "0.23.1"
  license   "Apache-2.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.23.1/all-smi-macos-aarch64.zip"
      sha256 "0f0e495213f44134eebc0989ae50120165d2959d329a052dfa6d90c248c7ad47"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.23.1/all-smi-linux-aarch64.tar.gz"
      sha256 "9368181bf5be0596d6acdecef5e642fd6a4aaf43be5c54e7ab6313c4308c88cc"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.23.1/all-smi-linux-x86_64.tar.gz"
      sha256 "b517cc8898ab7c26d2d3bd88fe679d7d9868fbdac8a087af623bcee4eaaf991f"
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
