class AigoServer < Formula
  desc      "Headless OpenAI-compatible LLM serving server for Backend.AI GO"
  homepage  "https://github.com/lablup/backend.ai-go"
  version "1.12.1"
  license "Apache-2.0"

  on_macos do
    depends_on macos: :sequoia
    depends_on arch: :arm64
    if Hardware::CPU.arm?
      url "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-server-macos-aarch64.zip"
      sha256 "0b9ab0de7b66eea91889377e5639b797176dbc9985fe78b03cf5a593d19368ef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-server-linux-aarch64.tar.gz"
      sha256 "cd366c70f40722a163033901ba15fb30bb8d9b234b7954606ae7c3028b49f1be"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-server-linux-x86_64.tar.gz"
      sha256 "524cfd474112bdbb7da72707ee9c9d5cddc5270a35f3a8abb44cb17aa915b46f"
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
