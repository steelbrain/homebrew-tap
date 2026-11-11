cask "lemurcam" do
  version "1.6"
  sha256 "0bc1a6fd0a6a06155a22fba20349529d3c265fa3ddde40ef144b72dd71153f76"

  url "https://github.com/steelbrain/LemurCam/releases/download/v#{version}/LemurCam.zip"
  name "LemurCam"
  desc "Virtual webcam for RTSP and ONVIF IP cameras"
  homepage "https://lemur.cam/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "LemurCam.app"

  zap trash: [
    "~/Library/Application Scripts/2KG9772KH6.cam.lemur.app",
    "~/Library/Application Support/LemurCam",
    "~/Library/Caches/cam.lemur.app",
    "~/Library/Group Containers/2KG9772KH6.cam.lemur.app",
    "~/Library/HTTPStorages/cam.lemur.app",
    "~/Library/Preferences/cam.lemur.app.plist",
  ]
end
