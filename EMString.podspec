Pod::Spec.new do |s|
  s.name             = "EMString"
  s.version          = "0.2.0"
  s.summary          = "EMString makes beautiful NSAttributedString using HTML's markup"
  s.description      = <<-DESC
                       EMString for Easy Markup String. A simple category on top of NSString using HTML's markup system to abstract the NSAttributedString API. @"<strong>Apply style with style</strong>".attributedString ;)
                       DESC
  s.homepage         = "https://github.com/TanguyAladenise/EMString"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Tanguy Aladenise" => "tanguy.alaedenise@gmail.com" }
  s.source           = { :git => "https://github.com/TanguyAladenise/EMString.git", :tag => '0.2.0' }
  # s.social_media_url = 'https://twitter.com/TanguyAladenise'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'EMString'
end
