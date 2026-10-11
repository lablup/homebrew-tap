class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/lablup/all-smi"
  version "0.27.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/all-smi/releases/download/v0.27.1/all-smi-macos-aarch64.zip"
      sha256 "464aeda6fb6c2e9c4bdb7fadd76c941355e9a5e95479e690d207fa8d43b1178c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/all-smi/releases/download/v0.27.1/all-smi-macos-x86_64.zip"
      sha256 "3cebf6383d11d3a45f880c805c68739961959832cde3f6646526037ddafb68a8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/all-smi/releases/download/v0.27.1/all-smi-linux-aarch64.tar.gz"
      sha256 "6df11c09c4905f1fa396a301fd8ca2cc796a175ddc2be2f53c6fa98365cfc891"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/all-smi/releases/download/v0.27.1/all-smi-linux-x86_64.tar.gz"
      sha256 "6b15681d43c9433b16c12f8df01d5fafa0a9e0bccb846938b22293a65601d8ea"
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
