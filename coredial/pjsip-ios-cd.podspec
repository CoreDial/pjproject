#
# Be sure to run `pod lib lint VaxSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'pjsip-ios-cd'
  s.version          = '1.2.0'
  s.summary          = 'PJSIP 2.8 headers and libs for iOS'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = ''
  s.license          = { :type => '', :file => 'LICENSE' }
  s.author           = { 'jrountree-cd' => 'jrountree@coredial.com' }
  s.platform     	 = :ios, '10.0'
  s.requires_arc 	 = false
  s.public_header_files = 'Pod/pjsip-include/**'
  s.preserve_paths 		= 'Pod/pjsip-include/**/**/*{h,hpp}'
  s.vendored_libraries 	= 'Pod/pjsip-lib/*.a'
  s.frameworks 			= 'CFNetwork', 'AudioToolbox', 'AVFoundation'
  s.xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => 'PJ_AUTOCONF=1',
    'HEADER_SEARCH_PATHS'  => '$(inherited) $(PODS_ROOT)/pjsip-ios-cd/Pod/pjsip-include'
  }
end
