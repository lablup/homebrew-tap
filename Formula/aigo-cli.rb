class AigoCli < Formula
  desc      "CLI client for Backend.AI GO (manage local LLM models and inference servers)"
  homepage  "https://github.com/lablup/backend.ai-go"
  version "1.11.0"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-cli-macos-aarch64.zip"
      sha256 "88369889f79c08640f4bfddad257620e523b8c82880b655eaf911b61e4ae58e9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-cli-linux-aarch64.tar.gz"
      sha256 "2046505ab2405f7491e8f17fb2290cddbaca9a6fafa185359f44d218119bb5d0"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-cli-linux-x86_64.tar.gz"
      sha256 "ce4ee107ba7db076b13ba0f804273c8401a659d3703a0efb6b59d259d4aee9d8"
    end
  end

  def install
    bin.install "aigo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aigo --version")
  end
end
