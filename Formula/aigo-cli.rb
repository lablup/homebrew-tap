class AigoCli < Formula
  desc      "CLI client for AI:GO (manage local LLM models and inference servers)"
  homepage  "https://github.com/lablup/backend.ai-go"
  version "2.0.0"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sequoia
    if Hardware::CPU.arm?
      url "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-cli-macos-aarch64.zip"
      sha256 "6227b65243ad8898694fc77c415edde2cd937ad98a3c1b5e994eb52cd4b651c8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-cli-linux-aarch64.tar.gz"
      sha256 "13a287bb33d2f301e8fb23b71aff796db4baa698459cf04b3a21f980666c9012"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-cli-linux-x86_64.tar.gz"
      sha256 "67833887ae0c81a72d44849a5139d4950cbc980bbbc94b94610e4d8aca36f611"
    end
  end

  def install
    bin.install "aigo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aigo --version")
  end
end
