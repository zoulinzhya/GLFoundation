Pod::Spec.new do |s|
  s.name = "GLFoundation"
  s.version = "0.1.0"
  s.summary = "A tool kits of GLFoundation."
  s.license = {"type"=>"MIT", "file"=>"LICENSE"}
  s.authors = {"zoulinzhya"=>"zoulinzhya@163.com"}
  s.homepage = "https://github.com/zoulinzhya/GLFoundation"
  s.description = "A tool kits of GLFoundation."
  s.frameworks = ["UIKit", "Foundation"]
  s.source = { :path => '.' }

  s.ios.deployment_target    = '8.0'
  s.ios.vendored_framework   = 'ios/GLFoundation.framework'
end
