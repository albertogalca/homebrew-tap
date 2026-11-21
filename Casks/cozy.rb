cask "cozy" do
  arch arm: "arm64", intel: "x64"

  version "1.10.1"
  sha256 arm:   "b66aaa78efcfa618736b86db4ad4932d94f1135086ce239b55e84902703fc460",
         intel: "015c61136fb3858ddeb712b3ffa707478f8425fbc86a1641ae5f6fb8c7c7ba6a"

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
