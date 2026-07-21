class AigoCli < Formula
  desc      "CLI client for Backend.AI GO (manage local LLM models and inference servers)"
  homepage  "https://github.com/lablup/backend.ai-go"
  version "1.10.2"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-cli-macos-aarch64.zip"
      sha256 "715ae5e71b1c732fa86f6d53d7f839beb005801e7fbc38b637d228a917f92c7e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-cli-linux-aarch64.tar.gz"
      sha256 "454fb8bb82513089dbfb6686098358b2c8278399769cb4aa6458523fdc8d4761"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-cli-linux-x86_64.tar.gz"
      sha256 "fbdb6600bc8540c1416c6027b273dd015b487c57428472a20f8110f5be43d333"
    end
  end

  def install
    bin.install "aigo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aigo --version")
  end
end
