class AigoServer < Formula
  desc      "Headless OpenAI-compatible LLM serving server for Backend.AI GO"
  homepage  "https://github.com/lablup/backend.ai-go"
  version "1.11.1"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-server-macos-aarch64.zip"
      sha256 "40427ddd6e64d14b72409df136e82aab9abbfa49b14f1af0822476d2abdf3676"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-server-linux-aarch64.tar.gz"
      sha256 "c4f2b268d2b7eb5302c7566e9243d004df4c6b2ba78c7c8f384ea4b6831faf3d"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-server-linux-x86_64.tar.gz"
      sha256 "0b75c0558918530316ae908d07221c0746093916ecce46531dd91eb74bfa5fdd"
    end
  end

  def install
    bin.install "aigo-server"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aigo-server --version")
  end
end
