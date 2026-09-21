class AigoCli < Formula
  desc      "CLI client for Backend.AI GO (manage local LLM models and inference servers)"
  homepage  "https://github.com/lablup/backend.ai-go"
  version "1.13.0"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sequoia
    if Hardware::CPU.arm?
      url "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-cli-macos-aarch64.zip"
      sha256 "ffb5cd871f4867596f9a71fa05e2c4db87e76c3b7b97a5496482cb463044dced"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-cli-linux-aarch64.tar.gz"
      sha256 "ad06dd8f76bfbb6fc689fb4102e1e3771080f46416750cfae5ad38708fcb954e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-cli-linux-x86_64.tar.gz"
      sha256 "6747570626ec5c4ea3ec1bf0e38c7067e45384b06067e0776812655025cf6abd"
    end
  end

  def install
    bin.install "aigo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aigo --version")
  end
end
