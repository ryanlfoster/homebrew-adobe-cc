cask :v1 => 'illustrator' do
  module Utils
    def self.name
      'Adobe Illustrator CC 2014'
    end
    def self.install_locale
      'en_US'
    end
    def self.installerPath
      "#{self.name}/Install.app/Contents/MacOS/Install"
    end
  end

  url 'http://trials3.adobe.com/AdobeProducts/ILST/18/osx10-64/Illustrator_18_LS20.dmg',
      :cookies => {
        'MM_TRIALS' => '1234'
      }

  homepage 'http://www.adobe.com/products/illustrator.html'
  version '18.0.0'
  #sha256 '08bcdf4f3cb7f438310951fc066734c5f4ac886623aa6dbcad0cd268b0cf6faf'
  installer :script => "#{Utils.installerPath}",
            :args => ['--mode=silent', "--deploymentFile=#{staged_path}/#{Utils.name}/Deployment/#{Utils.install_locale}_Deployment.xml"]

  uninstall :script => "#{Utils.installerPath}",
            :args => ['--mode=silent', "--action=uninstall", "--deploymentFile=#{staged_path}/#{Utils.name}/Deployment/#{Utils.install_locale}_Deployment.xml"]

  caveats 'You will need to quit all Adobe applications as well as all browsers for the install to succeed!'
end
