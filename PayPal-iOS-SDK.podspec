Pod::Spec.new do |spec|
  spec.name             = 'PayPal-iOS-SDK'
  spec.version          = '2.14.3'
  spec.license          = { type: 'BSD', file: 'LICENSE' }
  spec.homepage         = 'https://developer.paypal.com/webapps/developer/docs/integration/mobile/mobile-sdk-overview/'
  spec.authors          = { 'PayPal' => 'support@paypal.com' }
  spec.summary          = 'Accept credit cards and PayPal in your iOS app.'
  spec.description      = 'The PayPal iOS SDK provides a software library that makes it easy for an iOS developer to accept both credit cards and PayPal directly within their mobile app.'
  spec.source           = { :git => 'https://github.com/paypal/PayPal-iOS-SDK.git', :tag => "#{spec.version}" }
  spec.platform         = :ios, '6.1'
  spec.ios.deployment_target = '6.1'
  spec.requires_arc     = false

  #spec.default_subspec = 'Core', 'CardIO'
  spec.default_subspec = 'Core'

  spec.subspec 'Core' do |subspec|
    subspec.source_files     = [ 'PayPalMobile/*.h',  'PayPalMobile/*.module']
    subspec.preserve_path    = [ 'PayPalMobile/*.a' ]
    subspec.frameworks       = 'Accelerate', 'AudioToolbox', 'AVFoundation', 'CoreLocation', 'CoreMedia', 'MessageUI', 'MobileCoreServices', 'SystemConfiguration'
    subspec.vendored_libraries = [ 'PayPalMobile/libPayPalMobile.a' ]
    subspec.compiler_flags   = '-fmodules', '-fmodules-autolink'
    subspec.xcconfig         = { 'OTHER_LDFLAGS' => '-lc++ -ObjC', 'SWIFT_INCLUDE_PATHS' => '$(PODS_ROOT)/PayPalMobile'}
    #'HEADER_SEARCH_PATHS' => '$(PODS_ROOT)/PayPalMobile'
    subspec.module_map = 'PayPal-iOS-SDK.module'
    subspec.preserve_paths = 'PayPal-iOS-SDK.module'
  end

  #spec.subspec 'CardIO' do |subspec|
  #  subspec.dependency       'CardIO', '~> 5.3.2'
  #end
end
