cask "backend-ai-go" do
  version "1.8.0"
  sha256 "6afde74ad0f0513556c9bf1f1383169f73d83339cc561817ca4d9cbae598d0cd"

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
