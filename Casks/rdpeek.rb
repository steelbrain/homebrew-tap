cask "rdpeek" do
  version "1.3.1"
  sha256 "8a56ff78014dde2640680c3dc046de866af3c32e58945d88f6f9c8b0bde78713"

  url "https://github.com/steelbrain/RDPeek/releases/download/v#{version}/RDPeek.zip"
  name "RDPeek"
  desc "Remote Desktop Protocol client"
  homepage "https://rdpeek.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "RDPeek.app"

  zap trash: [
    "~/Library/Preferences/ai.aneesiqbal.rdpeek.plist",
    "~/Library/Saved Application State/ai.aneesiqbal.rdpeek.savedState",
  ]
end
