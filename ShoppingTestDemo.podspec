Pod::Spec.new do |s|
  s.name         = "ShoppingTestDemo"
  s.version      = "0.0.2"
  s.summary      = "A short description of ShoppingTestDemo. add model class"
  s.homepage     = "https://github.com/LongjieZhao/ShoppingCartDemo"
  s.license      = "MIT"
  s.author       = { "LongjieZhao" => "471727371@qq.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/LongjieZhao/ShoppingCartDemo.git", :tag => "0.0.2" }
  s.source_files  = "ShoppingTestDemo/*"
  s.exclude_files = "UIKit"
  s.requires_arc = true
  s.dependency "MJExtension","~> 3.0.13"
end
