class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/lablup/all-smi"
  version "0.26.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/all-smi/releases/download/v0.26.1/all-smi-macos-aarch64.zip"
      sha256 "5f9ec117ece34eef2277fe9d8da98fc263fa82dfe818031d2c6540775494afd9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/all-smi/releases/download/v0.26.1/all-smi-macos-x86_64.zip"
      sha256 "70f9202df2bffcd0b398c904418a516cb252fecbf88ccb0a66bc37bc0ea5a3bc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/all-smi/releases/download/v0.26.1/all-smi-linux-aarch64.tar.gz"
      sha256 "9c186f666664ea5925385c7fbcbb2448ec90869786e2f85df0d3b3b2437eecb2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/all-smi/releases/download/v0.26.1/all-smi-linux-x86_64.tar.gz"
      sha256 "3c49f9ed17db31d5fa5d4962b75e177deb9fafcb708dc5e38041f073ccc00cbe"
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
