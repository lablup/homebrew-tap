class AigoCli < Formula
  desc      "CLI client for AI:GO (manage local LLM models and inference servers)"
  homepage  "https://github.com/lablup/backend.ai-go"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sequoia
    if Hardware::CPU.arm?
      url "https://github.com/lablup/backend.ai-go-releases/releases/download/v2.0.3/aigo-cli-macos-aarch64.zip"
      sha256 "6e6ab13240bfeb57e535385969f1b2cc3ed588116cfa6c803c6eec386a1b76d1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/backend.ai-go-releases/releases/download/v2.0.3/aigo-cli-linux-aarch64.tar.gz"
      sha256 "b9128447e9ca6028309318ca8b2816e620b25e5ab2c0871eb63e31c6884300cd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/backend.ai-go-releases/releases/download/v2.0.3/aigo-cli-linux-x86_64.tar.gz"
      sha256 "365a947c4205a63f5ec3588d7c541ed512e76c7f21e13d7bb12faf6c84a4f566"
    end
  end

  def install
    bin.install "aigo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aigo --version")
  end
end
