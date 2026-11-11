cask "rdpeek" do
  version "1.3.2"
  sha256 "cd011dce86df031f8c60fda4537438a4b74514927bc029cd32cb6c7c377df4cd"

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
