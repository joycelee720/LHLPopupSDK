
Pod::Spec.new do |s|
  s.name         = "LHLPopupSDK"
  s.version      = "1.0.1"
  s.summary      = "show a popup select view."
  s.homepage     = "https://github.com/joycelee720/LHLPopupSDK.git"
  s.license      = "MIT"
  s.author       = { "joycelee720" => "1007521788@qq.com" }
  s.source       = { :git => "https://github.com/joycelee720/LHLPopupSDK.git", :tag => s.version }
  s.ios.source_files  = "LHLPopupSDK/*.{h,m}"
  s.requires_arc = true
  s.ios.deployment_target = "8.0"
  s.ios.framework  = "UIKit"

end
