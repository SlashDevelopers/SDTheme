#
# Be sure to run `pod lib lint SDTheme.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SDTheme'
  s.version          = '0.1.1'
  s.summary          = 'A lightweight skin switching solution.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/SlashDevelopers/SDTheme'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'maligh' => '455080311@qq.com' , 'culeo' => '1823280359@qq.com'}
  s.source           = { :git => 'https://github.com/SlashDevelopers/SDTheme.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'SDTheme/Classes/**/*.{m,h}'
  s.public_header_files = 'SDTheme/Classes/**/*.h'

  s.subspec 'Core' do |ss|
    ss.source_files = 'SDTheme/Classes/Core/*.{m,h}'
    ss.public_header_files = 'SDTheme/Classes/Core/*.h'
  end
  s.subspec 'UIKit' do |ss|
    ss.source_files = 'SDTheme/Classes/UIKit/*.{m,h}'
    ss.public_header_files = 'SDTheme/Classes/UIKit/*.h'
    ss.dependency 'SDTheme/Core'
  end


end
