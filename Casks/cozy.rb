cask "cozy" do
  arch arm: "arm64", intel: "x64"

  version "1.9.1"
  sha256 arm:   "f4129abe392e4ba7b324767c498de50253fa4ae9f529a9a4963e519387e66613",
         intel: "b9d001a9d3d4439f0702fb18b6e9601d883057eafb1305c5c0a17136c6bae255"

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
