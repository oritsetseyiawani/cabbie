# Uncomment the next line to define a global platform for your project
platform :ios, '15.0'

target 'Cabbie' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Cabbie

pod 'Firebase/Auth'
pod 'Firebase/Core', :modular_headers => true
pod 'Firebase/Firestore'
pod 'GooglePlaces'
  target 'CabbieTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'CabbieUITests' do
    # Pods for testing
  end

  post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
      config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
    end
    
  end
  
  
end
