cask "dhol" do
  version "0.1.0"
  sha256 "a85796933166baccb5537e70787dd39eb11f7e6b64b1aeab3dc463732717416a"

  url "https://github.com/steelbrain/dhol.app/releases/download/v#{version}/Dhol.zip"
  name "Dhol"
  desc "On-device speech-to-text dictation"
  homepage "https://github.com/steelbrain/dhol.app"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Dhol.app"

  zap trash: [
    "~/.cache/huggingface/hub/.locks/models--mlx-community--parakeet-tdt-0.6b-v3",
    "~/.cache/huggingface/hub/mlx-audio/mlx-community_parakeet-tdt-0.6b-v3",
    "~/.cache/huggingface/hub/models--mlx-community--parakeet-tdt-0.6b-v3",
    "~/Library/Caches/ai.aneesiqbal.dhol",
    "~/Library/HTTPStorages/ai.aneesiqbal.dhol",
    "~/Library/Preferences/ai.aneesiqbal.dhol.plist",
  ]
end
