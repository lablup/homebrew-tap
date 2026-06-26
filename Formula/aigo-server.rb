class AigoServer < Formula
  desc      "Headless OpenAI-compatible LLM serving server for Backend.AI GO"
  homepage  "https://github.com/lablup/backend.ai-go"
  version "1.9.1"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-server-macos-aarch64.zip"
      sha256 "161766f976e741344eeada37a075f645ca299078c083372813ad778ecb38feb8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-server-linux-aarch64.tar.gz"
      sha256 "db242796e2c158d0f7418b65de72485734f6c2f0f33e090bb528d7a1e40b56da"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-server-linux-x86_64.tar.gz"
      sha256 "d568ac029814c2ad96e8fd6c32c892c34e956deca0ace17f5d8ac45834b4bb64"
    end
  end

  def install
    bin.install "aigo-server"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aigo-server --version")
  end
end
