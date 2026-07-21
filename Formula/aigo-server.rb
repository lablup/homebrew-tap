class AigoServer < Formula
  desc      "Headless OpenAI-compatible LLM serving server for Backend.AI GO"
  homepage  "https://github.com/lablup/backend.ai-go"
  version "1.10.2"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-server-macos-aarch64.zip"
      sha256 "9ca3743bb30852d47b220d60980adac03776645888b21a83df63689fd3bd71f4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-server-linux-aarch64.tar.gz"
      sha256 "c828e63eeb9a3f881a25f2ac67bb3e144ebc16e69b6c0ed4727280f443332cc8"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-server-linux-x86_64.tar.gz"
      sha256 "df498c5748400120b78c3f882c7cc74cdc24f8085df9c6956761e3881106a2f7"
    end
  end

  def install
    bin.install "aigo-server"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aigo-server --version")
  end
end
