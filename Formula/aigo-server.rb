class AigoServer < Formula
  desc      "Headless OpenAI-compatible LLM serving server for AI:GO"
  homepage  "https://github.com/lablup/backend.ai-go"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sequoia
    if Hardware::CPU.arm?
      url "https://github.com/lablup/backend.ai-go-releases/releases/download/v2.0.2/aigo-server-macos-aarch64.zip"
      sha256 "5bef4ca6ebe1a4eec88a16f8a6c597e2175a0d1589f14ba940d6735e0c8c03c6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/backend.ai-go-releases/releases/download/v2.0.2/aigo-server-linux-aarch64.tar.gz"
      sha256 "18a19cbfda8c175035191f787ce357266fa4831eb29a9b08d2c223521ef4de57"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/backend.ai-go-releases/releases/download/v2.0.2/aigo-server-linux-x86_64.tar.gz"
      sha256 "5604f25b1788d9ad199aa167dc6405862bacf7e6c7471fb03c3c5e3de9d70fe2"
    end
  end

  def install
    # continuum-router is the request-routing layer behind /v1.
    # aigo-server starts it at boot and resolves it as
    # <exe_dir>/continuum-router, and model-metadata.yaml and the
    # model-metadata.d/ vendor fragments are read as siblings of the
    # executable, so all of them land in bin together.
    bin.install "aigo-server", "continuum-router"
    bin.install "model-metadata.yaml"
    bin.install "model-metadata.d"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aigo-server --version")
    # A formula that installed only the server would boot a routing
    # layer that is silently dead, warning once in the log and
    # otherwise looking healthy (issue #4233).
    assert_path_exists bin/"continuum-router"
    assert_path_exists bin/"model-metadata.yaml"
    assert_predicate bin/"model-metadata.d", :directory?
  end
end
