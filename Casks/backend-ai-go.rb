cask "backend-ai-go" do
  version "1.10.0"
  sha256 "3c234d999c60e54a83e60c828bed69a62501bb5f7a7c6ab81b9ba3c44e09ee5b"

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
