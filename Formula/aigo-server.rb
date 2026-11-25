class AigoServer < Formula
  desc      "Headless OpenAI-compatible LLM serving server for AI:GO"
  homepage  "https://github.com/lablup/backend.ai-go"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sequoia
    if Hardware::CPU.arm?
      url "https://github.com/lablup/backend.ai-go-releases/releases/download/v2.0.3/aigo-server-macos-aarch64.zip"
      sha256 "8b4c6b73e683f4e35400d8504b3385d5fb56f7efac3f1ebfadef00ed870dd427"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/backend.ai-go-releases/releases/download/v2.0.3/aigo-server-linux-aarch64.tar.gz"
      sha256 "10c1e85424d53988b31be3353d462dc8ff6fa9a3fff8e7fcf1b73b39e6371e2f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/backend.ai-go-releases/releases/download/v2.0.3/aigo-server-linux-x86_64.tar.gz"
      sha256 "fff54e36dbcd4c5e479698f631052f909078d6f8669201f6727807e4360a3089"
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
