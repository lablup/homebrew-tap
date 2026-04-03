cask "backend-ai-go" do
  version "1.5.4"
  sha256 "46bf08f64f8805ea0751191964484083f7723ece697dcd9fa30e9bdbfbe823ac"

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
