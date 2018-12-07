cask 'steam' do
  version :latest
  sha256 :no_check

  # steamcdn-a.akamaihd.net was verified as official when first introduced to the cask
  url 'https://steamcdn-a.akamaihd.net/client/installer/steam.dmg'
  # get the url from the App downloaded from the official website
  url 'https://media.st.dl.bscstorage.net/client/installer/steam.dmg'
  name 'Steam'
  homepage 'https://store.steampowered.com/about/'

  app 'Steam.app'

  uninstall quit:      [
                         'com.valvesoftware.steam',
                         'com.valvesoftware.steam.helper',
                         'com.valvesoftware.steam.helper.EH',
                       ],
            launchctl: [
                         'com.valvesoftware.steamclean',
                         'com.valvesoftware.steam.ipctool',
                       ]

  zap trash: [
               '~/Library/LaunchAgents/com.valvesoftware.steamclean.plist',
               '~/Library/Preferences/com.valvesoftware.steam.helper.plist',
               '~/Library/Application Support/Steam/',
               '~/Library/Saved Application State/com.valvesoftware.steam.savedState/',
             ]
end
