# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Vome' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Vome
  
  pod 'Alamofire’, '4.5.0'
  pod 'AlamofireImage', '3.2.0'
  pod 'AlamofireObjectMapper’, '4.1.0'
  pod 'IQKeyboardManagerSwift', '4.0.11'
  pod 'SlideMenuControllerSwift', '3.0.1'
  pod 'SVProgressHUD', '2.2.2'
  pod 'DropDown', '2.0.0'
  pod 'Applozic'

  post_install do |installer|
      installer.pods_project.targets.each do |target|
          target.build_configurations.each do |config|
              config.build_settings['SWIFT_VERSION'] = '3.0'
          end
      end
  end




end
