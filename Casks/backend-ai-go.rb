cask "backend-ai-go" do
  version "2.0.1"
  sha256 "3b530c42fbae4ffee2e9d57b156ba47cf1e136d87af98e06e98dbb8847902bd1"

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
