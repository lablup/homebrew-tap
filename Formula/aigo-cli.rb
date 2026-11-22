class AigoCli < Formula
  desc      "CLI client for AI:GO (manage local LLM models and inference servers)"
  homepage  "https://github.com/lablup/backend.ai-go"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sequoia
    if Hardware::CPU.arm?
      url "https://github.com/lablup/backend.ai-go-releases/releases/download/v2.0.2/aigo-cli-macos-aarch64.zip"
      sha256 "717af79ab571a99542ac27d49fe5d49f3a3de1a51ff9944d4ac43f2ed1169b1f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/backend.ai-go-releases/releases/download/v2.0.2/aigo-cli-linux-aarch64.tar.gz"
      sha256 "5a20e3f4858807e4bbeed0f375fd5d61870db30e12314b644fdcfe428ff4f462"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/backend.ai-go-releases/releases/download/v2.0.2/aigo-cli-linux-x86_64.tar.gz"
      sha256 "a146dac0c41df78c00559e65641e4ec6271203cb3e2876bc8224f808096b966a"
    end
  end

  def install
    bin.install "aigo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aigo --version")
  end
end
