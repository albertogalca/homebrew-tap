cask "cozy" do
  arch arm: "arm64", intel: "x64"

  version "1.10.0"
  sha256 arm:   "b958c558ba12b1688e461ddcfda657b0769ced0b75ebfdea270f9094127d6b05",
         intel: "951eab7fe2c7db34d59962bb8ee7562704debc9c09492e881fbd26627f6b0b95"

  url "https://cozyjournal.app/downloads/cozy-#{version}-#{arch}.dmg"
  name "Cozy"
  desc "Private journal that keeps entries as plain files on disk"
  homepage "https://cozyjournal.app/"

  livecheck do
    url "https://github.com/albertogalca/cozy-releases/releases/latest/download/latest-mac.yml"
    strategy :electron_builder
  end

  auto_updates true
  depends_on macos: :monterey

  app "Cozy.app"

  uninstall quit: "com.cantimplorastudio.cozy"

  zap trash: [
    "~/Library/Application Support/cozy",
    "~/Library/Caches/cozy-updater",
    "~/Library/HTTPStorages/com.cantimplorastudio.cozy",
    "~/Library/Logs/cozy",
    "~/Library/Preferences/com.cantimplorastudio.cozy.plist",
  ]
end
