cask "backend-ai-go" do
  version "2.0.2"
  sha256 "f954084ad523a72801b25e9d96571df55ea34f09f4e76f259b115dcb0ccdd346"

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
