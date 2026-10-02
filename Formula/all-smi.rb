class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/lablup/all-smi"
  version "0.27.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/all-smi/releases/download/v0.27.0/all-smi-macos-aarch64.zip"
      sha256 "8c738201deda70e9325d902eb0e78b8d0d6cb0322461560f8b6f12c86e608b29"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/all-smi/releases/download/v0.27.0/all-smi-macos-x86_64.zip"
      sha256 "47896ab4d50f9e5cdb22aec267e472acfb9789adfda144ff4df37a0257aee597"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/all-smi/releases/download/v0.27.0/all-smi-linux-aarch64.tar.gz"
      sha256 "47d8fe54c75c0b1551a2e8e3c311bb4a9f87d581b3646e51a26bc8b08cd9d9c6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/all-smi/releases/download/v0.27.0/all-smi-linux-x86_64.tar.gz"
      sha256 "cc06b06426350236943b4a727b214e2624856843f2ddecd1b9586c9eac09d876"
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
