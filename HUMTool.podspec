#
# Be sure to run `pod lib lint HUMTool.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HUMTool'
  s.version          = '1.0.6'
  s.summary          = 'OC 拓展类 包括宏定义 字体颜色设置 常用工具、VC方法拓展等.'
  s.description      = 'HUMTool'

  s.homepage         = 'https://github.com/HUMiooo/HUMTool'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'HUMioo' => 'humioozcs@163.com' }
  s.source           = { :git => 'https://github.com/HUMiooo/HUMTool.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'HUMTool/Classes/**/*'
  
  # s.resource_bundles = {
  #   'HUMTool' => ['HUMTool/Assets/*.png']
  # }
  
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  
  s.dependency 'MyLayout'
  s.dependency 'HBDNavigationBar'
  s.dependency 'HBDStatusBar'
  s.dependency 'QMUIKit/QMUIComponents'
  s.subspec 'QMUIResources' do |ss|
    ss.resource_bundles = {'QMUIResources' => ['QMUIKit/QMUIResources/*.*']}
  end
  s.dependency 'LSTPopView'
end
