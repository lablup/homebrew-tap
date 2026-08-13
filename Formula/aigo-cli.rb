class AigoCli < Formula
  desc      "CLI client for Backend.AI GO (manage local LLM models and inference servers)"
  homepage  "https://github.com/lablup/backend.ai-go"
  version "1.12.0"
  license "Apache-2.0"

  on_macos do
    depends_on macos: :sequoia
    depends_on arch: :arm64
    if Hardware::CPU.arm?
      url "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-cli-macos-aarch64.zip"
      sha256 "3357d4f2ca5f32d7de3b9fb6abef9bedbfcc05b95d56bd60aa172afb6739c5a4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-cli-linux-aarch64.tar.gz"
      sha256 "d07328e3063e2e81a8969d5abad177f093b0196b06f2462799462956fb7bbfd9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-cli-linux-x86_64.tar.gz"
      sha256 "cd14d4ec3633bf523575882bd45a9d77d9cd800900612a4fec11154195949236"
    end
  end

  def install
    bin.install "aigo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aigo --version")
  end
end
