cask "backend-ai-go" do
  version "1.13.0"
  sha256 "15aae92c31a064d2e2bc681ca8c4c5c3994b8c021fadcf7d7cc3edebd51d1bef"

  url "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/backend-ai-go-#{version}-macos-arm64.dmg",
      verified: "github.com/lablup/backend.ai-go-releases/"
  name "Backend.AI GO"
  desc "Agentic workflow platform with a cross-platform LLM serving"
  homepage "https://go.backend.ai/"

  depends_on macos: :sequoia
  depends_on arch: :arm64

  app "Backend.AI GO.app"

  zap trash: [
    "~/Library/Application Support/ai.backend.go",
    "~/Library/Caches/ai.backend.go",
    "~/Library/Preferences/ai.backend.go.plist",
  ]
end
