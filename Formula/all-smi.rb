class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/lablup/all-smi"
  version "0.28.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/all-smi/releases/download/v0.28.0/all-smi-macos-aarch64.zip"
      sha256 "3d038f059ef9448f7207d32a9b5182a67b036229ade611a0e9f4706a760c03e1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/all-smi/releases/download/v0.28.0/all-smi-macos-x86_64.zip"
      sha256 "cebd20ea407c63920da3d666a04d92ebbd7963eb0e8d3907be59e067b1927668"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/all-smi/releases/download/v0.28.0/all-smi-linux-aarch64.tar.gz"
      sha256 "94310b74fb87787774a05ae63b659fb8b82bbf3aff6af7426b5dd2a39fd653ea"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/all-smi/releases/download/v0.28.0/all-smi-linux-x86_64.tar.gz"
      sha256 "67ed42b87ad92b28cf7598ea792eceec3bc4dec24411a27597aa0b59e90fdcce"
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
