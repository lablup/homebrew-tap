class AigoServer < Formula
  desc      "Headless OpenAI-compatible LLM serving server for Backend.AI GO"
  homepage  "https://github.com/lablup/backend.ai-go"
  version "1.11.0"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-server-macos-aarch64.zip"
      sha256 "bef5d5d21b734af181a0528f04cd9170d48f75a3a54760beada4a1ef41c13be1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-server-linux-aarch64.tar.gz"
      sha256 "85ac46421ece5ccbefed8522ae007d81f8dbab004c2cba314d111a56eaa6856a"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-server-linux-x86_64.tar.gz"
      sha256 "0d337780b4b5edfaea86a14ac0eecd2f29d6d412afcb024b537be1835c027be0"
    end
  end

  def install
    bin.install "aigo-server"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aigo-server --version")
  end
end
