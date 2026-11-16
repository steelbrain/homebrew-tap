cask "rdpeek" do
  version "1.4.0"
  sha256 "87511b9ed3440fb7451a2dc1db090c3c0fb774d4df66eb3728a0ab6d8d0fe754"

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
