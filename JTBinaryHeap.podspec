#
# Be sure to run `pod lib lint JTBinaryHeap.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#

Pod::Spec.new do |s|
  s.name             = "JTBinaryHeap"
  s.version          = "1.0.0"
  s.summary          = "A simple CFBinaryHeap wrapper in Objective-C for simple consumption in Obj-C / Swift Projects."
  s.homepage         = "https://github.com/joshpc/JTBinaryHeap"
  s.license          = 'MIT'
  s.author           = { "Joshua Tessier" => "joshpc@gmail.com" }
  s.source           = { :git => "https://github.com/joshpc/JTBinaryHeap.git", :tag => s.version.to_s }
  s.platform         = :ios, '7.0'
  s.requires_arc     = true

  s.source_files     = 'JTBinaryHeap/**/*'

  s.public_header_files = 'JTBinaryHeap/**/*.h'
  s.frameworks = 'Foundation'
end
