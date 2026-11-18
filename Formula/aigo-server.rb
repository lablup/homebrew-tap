class AigoServer < Formula
  desc      "Headless OpenAI-compatible LLM serving server for AI:GO"
  homepage  "https://github.com/lablup/backend.ai-go"
  version "2.0.0"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sequoia
    if Hardware::CPU.arm?
      url "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-server-macos-aarch64.zip"
      sha256 "56a86225bfa46e24e7f79d00ad277e6d078a463cce65e26fb1f3749350b2ba2a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-server-linux-aarch64.tar.gz"
      sha256 "a297f0f67bb87109a0d38418b0ad413c143614eaf9eab72fbf67961da2e758c6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-server-linux-x86_64.tar.gz"
      sha256 "9bd075a544c3ca489bafd5c45fae22b992f62eab776160425445aaa93cb893b9"
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
