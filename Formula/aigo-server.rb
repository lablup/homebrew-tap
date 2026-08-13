class AigoServer < Formula
  desc      "Headless OpenAI-compatible LLM serving server for Backend.AI GO"
  homepage  "https://github.com/lablup/backend.ai-go"
  version "1.12.0"
  license "Apache-2.0"

  on_macos do
    depends_on macos: :sequoia
    depends_on arch: :arm64
    if Hardware::CPU.arm?
      url "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-server-macos-aarch64.zip"
      sha256 "f84ebf0ce529b2ec2cdc46424f715cdf129762f033d5f1f837438d0e4a5462f9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-server-linux-aarch64.tar.gz"
      sha256 "4a5ff37e8fafe6ee74567d384b820528f07ac5834366dafd2544cb287ded4ce6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-server-linux-x86_64.tar.gz"
      sha256 "844a8c9796d7edbe52a7f8b93cbf1ad52b0cae307603557d116e30789ef6c48f"
    end
  end

  def install
    # continuum-router is the request-routing layer behind /v1.
    # aigo-server starts it at boot and resolves it as
    # <exe_dir>/continuum-router, and model-metadata.yaml is read as a
    # sibling of the executable, so all three land in bin together.
    bin.install "aigo-server", "continuum-router"
    bin.install "model-metadata.yaml"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aigo-server --version")
    # A formula that installed only the server would boot a routing
    # layer that is silently dead, warning once in the log and
    # otherwise looking healthy (issue #4233).
    assert_predicate bin/"continuum-router", :exist?
    assert_predicate bin/"model-metadata.yaml", :exist?
  end
end
