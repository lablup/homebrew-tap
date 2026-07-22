class AigoServer < Formula
  desc      "Headless OpenAI-compatible LLM serving server for Backend.AI GO"
  homepage  "https://github.com/lablup/backend.ai-go"
  version "1.11.0"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-server-macos-aarch64.zip"
      sha256 "47cd3e90be1b9b1282089133233302017e68fe7cd9997af00b8a69e4b1a3a95c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-server-linux-aarch64.tar.gz"
      sha256 "55ceec1f38d3520b40e8cf3c001cf9030d7bc51f3e9a77a2782ad59d63d1bef7"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-server-linux-x86_64.tar.gz"
      sha256 "10e2edbff3b3093370a3c47a640ddc8f2ac963285b77fe58bcd46c9c1f43e9a4"
    end
  end

  def install
    bin.install "aigo-server"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aigo-server --version")
  end
end
