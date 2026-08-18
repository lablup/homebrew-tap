cask "backend-ai-go" do
  version "1.12.1"
  sha256 "d0127fb99a705a1884f2f450114ebd01e1b4474dd681ebc2faed7fc02bc0b729"

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
