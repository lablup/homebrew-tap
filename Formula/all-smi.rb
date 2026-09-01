class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/lablup/all-smi"
  version "0.26.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/all-smi/releases/download/v0.26.3/all-smi-macos-aarch64.zip"
      sha256 "a111e0e0abebd2f46607a5135cc09f5af134884a15ea517e7765c7922e06d589"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/all-smi/releases/download/v0.26.3/all-smi-macos-x86_64.zip"
      sha256 "d212b94f2ae12e8af9cca1bd5a99f0e187515cc476340544ea8719c845dafa88"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/all-smi/releases/download/v0.26.3/all-smi-linux-aarch64.tar.gz"
      sha256 "8c61882418bbf8e9a4a7ca84a6bc99fd2fe8ad5d69cef410f7d004431f002377"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/all-smi/releases/download/v0.26.3/all-smi-linux-x86_64.tar.gz"
      sha256 "4c26fa7a61dc5bf6de1a58bd4a8cb819efba209ba513f758c51cdc36e7676cd5"
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
