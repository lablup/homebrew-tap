class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/lablup/all-smi"
  version "0.17.5"
  license   "Apache-2.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/inureyes/all-smi/releases/download/v0.17.5/all-smi-macos-aarch64.zip"
      sha256 "4bd49094ae0da42fe626c061d6f386c59420a54a1c77e40b3255e0dd1a2ae22e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.17.5/all-smi-linux-aarch64.tar.gz"
      sha256 "329dc4acdac9e28c9afe74a1ad2d7f29108215b605a6af642a1b124ce855001e"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/inureyes/all-smi/releases/download/v0.17.5/all-smi-linux-x86_64.tar.gz"
      sha256 "854cb04244d9f7af43698dc3869f6cdc8ae121cab4b21734b1cf9dd0ee4ab908"
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
