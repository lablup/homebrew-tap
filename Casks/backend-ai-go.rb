cask "backend-ai-go" do
  version "2.0.0"
  sha256 "2f0f0ea734137fbf566ba9bf8a99c101d818fb40b2fe304877cb3d18c44cf57d"

  url "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/backend-ai-go-#{version}-macos-arm64.dmg",
      verified: "github.com/lablup/backend.ai-go-releases/"
  name "AI:GO"
  desc "Agentic workflow platform with a cross-platform LLM serving"
  homepage "https://go.backend.ai/"

  depends_on macos: :sequoia
  depends_on arch: :arm64

  app "AI-GO.app"

  zap trash: [
    "~/Library/Application Support/ai.backend.go",
    "~/Library/Caches/ai.backend.go",
    "~/Library/Preferences/ai.backend.go.plist",
  ]
end
