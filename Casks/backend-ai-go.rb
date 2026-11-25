cask "backend-ai-go" do
  version "2.0.3"
  sha256 "d1a31652258961f27b444d4db27caf9361e33ee638cd991218e6f4eb884e01c3"

  url "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/backend-ai-go-#{version}-macos-arm64.dmg"
  name "AI:GO"
  desc "Agentic workflow platform with a cross-platform LLM serving"
  homepage "https://go.backend.ai/"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "AI-GO.app"

  zap trash: [
    "~/Library/Application Support/ai.backend.go",
    "~/Library/Caches/ai.backend.go",
    "~/Library/Preferences/ai.backend.go.plist",
  ]
end
