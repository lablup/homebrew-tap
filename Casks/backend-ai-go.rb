cask "backend-ai-go" do
  version "1.12.0"
  sha256 "75ec3529b4b671f1178b58a91dbae2a94fa91a2e533f56020374b6105ab07c46"

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
