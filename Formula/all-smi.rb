class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/lablup/all-smi"
  version "0.26.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/all-smi/releases/download/v0.26.2/all-smi-macos-aarch64.zip"
      sha256 "bb934940a198a96130c558a7829009476954d9117389a8bf7cb9ffa40094eb3a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/all-smi/releases/download/v0.26.2/all-smi-macos-x86_64.zip"
      sha256 "a2bdc70abae18e5a48b9fa87eed6ba09ed4b45baaf30f13baa48434417ab5503"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/all-smi/releases/download/v0.26.2/all-smi-linux-aarch64.tar.gz"
      sha256 "4ab023cf21927b255a4caf12c6149e24ae2782c994b07725891996c8b0e6ce18"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/all-smi/releases/download/v0.26.2/all-smi-linux-x86_64.tar.gz"
      sha256 "846af2669cfee5ef1b6c0d48e52ed882d0598757c3a647acecd18415ef7975d6"
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
