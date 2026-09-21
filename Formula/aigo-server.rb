class AigoServer < Formula
  desc      "Headless OpenAI-compatible LLM serving server for Backend.AI GO"
  homepage  "https://github.com/lablup/backend.ai-go"
  version "1.13.0"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sequoia
    if Hardware::CPU.arm?
      url "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-server-macos-aarch64.zip"
      sha256 "9d61cfd3ee0da92cbb12aab2e04f9a1d16bce9d81fb09ed03839ea60bdb60917"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-server-linux-aarch64.tar.gz"
      sha256 "fa3ce5d660cac76d507e053f70ea5684bb5c8a86b0bb8eddeb7daaf8680fbfe1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/aigo-server-linux-x86_64.tar.gz"
      sha256 "7568d6eb01f12a9f638d9dbfd2d7b4862b2278a0f29b9fecb387dbe4749d8a86"
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
    assert_path_exists bin/"continuum-router"
    assert_path_exists bin/"model-metadata.yaml"
  end
end
