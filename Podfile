platform :ios, ‘13.0’

# ignore all warnings from all pods
inhibit_all_warnings!

use_frameworks!

target ‘TeachOrgCalendar’ do
	
	# Codestyle
	pod 'SwiftLint'
	
	# Analytics
	
	# DI
	pod 'Swinject'
	pod 'SwinjectStoryboard'

	#Auth
	pod 'Firebase'
 	pod 'Firebase/Core'
	pod 'FirebaseUI/Auth'
	pod 'FirebaseUI/Google'
	pod 'FirebaseEmailAuthUI'
	pod 'FirebaseUI/OAuth' # Used for Sign in with Apple, Twitter, etc
	pod 'FirebaseUI/Phone'

	# Data Storage
	pod 'Firebase/Database'
	
	# UI
	pod 'SnapKit'
	pod 'CVCalendar'

	# Other
	
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
    end
  end
end
