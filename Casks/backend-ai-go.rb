cask "backend-ai-go" do
  version "1.9.1"
  sha256 "98b80568badf5e515dd413e8f842cdf57fd807c72365f66a125a08fce746bd3c"

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
