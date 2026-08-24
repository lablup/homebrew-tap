class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/lablup/all-smi"
  version "0.26.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/all-smi/releases/download/v0.26.0/all-smi-macos-aarch64.zip"
      sha256 "cf04da77ed982f646fa8d3103b18bc81e82526a83e97d5fa7c3d6bad2a78bdbd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/all-smi/releases/download/v0.26.0/all-smi-linux-aarch64.tar.gz"
      sha256 "faf1c080e740c11919caa1c69bfb5c0d1b81ddac48663ba929be8238655c6b8f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/all-smi/releases/download/v0.26.0/all-smi-linux-x86_64.tar.gz"
      sha256 "587980543e4d61dd565b7165e1728b5e99714220e06ccebaf27b73b68631a2ec"
    end
  end

  def install
    bin.install "all-smi"
    man1.install "all-smi.1"
  end

  service do
    run [opt_bin/"all-smi", "api"]
    keep_alive true
    log_path var/"log/all-smi.log"
    error_log_path var/"log/all-smi.log"
    process_type :background
  end

  test do
    output = shell_output("#{bin}/all-smi --version")
    assert_match(/all-smi\s+#{version}/, output)
  end
end
