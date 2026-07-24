class AllSmi < Formula
  desc      "GPU ‘top’ for NVIDIA/Jetson/Apple Silicon/Tenstorrent"
  homepage  "https://github.com/lablup/all-smi"
  version "0.24.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inureyes/all-smi/releases/download/v0.24.2/all-smi-macos-aarch64.zip"
      sha256 "a0bdbccf61ab145a0a0547a59e708e18796a26407e4bb4a0924e52922c6bb5eb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/inureyes/all-smi/releases/download/v0.24.2/all-smi-linux-aarch64.tar.gz"
      sha256 "bbdc3e0ea1a4e368fe5593bcdd584bf605e20c161abfba223ecce9a328581ec9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/inureyes/all-smi/releases/download/v0.24.2/all-smi-linux-x86_64.tar.gz"
      sha256 "9909389e0db305a48573d3ec8635275e3802178949c358676b9643e5ef65d82b"
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
