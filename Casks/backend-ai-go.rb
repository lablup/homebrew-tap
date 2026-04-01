cask "backend-ai-go" do
  version "1.5.3"
  sha256 "d6c1725a3a9125f128cd93f6ad7be6bb8889c8e2372ab93080563a59b3141efc"

  url "https://github.com/lablup/backend.ai-go-releases/releases/download/v#{version}/backend-ai-go-#{version}-macos-arm64.dmg"
  name "Backend.AI GO"
  desc "Cross-platform LLM serving desktop application"
  homepage "https://backendai.io"

  depends_on macos: ">= :ventura"

  app "Backend.AI GO.app"

  zap trash: [
    "~/Library/Application Support/ai.backend.go",
    "~/Library/Caches/ai.backend.go",
    "~/Library/Preferences/ai.backend.go.plist",
  ]
end
