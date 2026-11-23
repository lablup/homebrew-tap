class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/lablup/all-smi"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/all-smi/releases/download/v0.29.1/all-smi-macos-aarch64.zip"
      sha256 "31de380489ed511a3017586599222fbc8cb8ba75bac7cfa3656042632810e6b9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/all-smi/releases/download/v0.29.1/all-smi-linux-aarch64.tar.gz"
      sha256 "42c4a534159f6f02882b65c4ecdd068c6ad314812a62d6e8c392a63dc02918b0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/all-smi/releases/download/v0.29.1/all-smi-linux-x86_64.tar.gz"
      sha256 "69ab9e474e7eacc861b2fe6958a43e6d24b3593c0c2a0153760ef06317eb73e5"
    end
  end

  def install
    bin.install "all-smi"
    (lib/"all-smi").install "liball_smi_amd.so" if OS.linux?
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
