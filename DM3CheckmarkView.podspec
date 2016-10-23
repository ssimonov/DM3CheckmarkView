Pod::Spec.new do |s|
  s.name         = "DM3CheckmarkView"
  s.version      = "0.0.2"
  s.summary      = "Basic checkmark animation"
  s.description  = <<-DESC
  Simple checkmar animation.
                   DESC
  s.homepage     = "https://github.com/dmi3j/DM3CheckmarkView"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Dmitry Beloborodov" => "dmi3j@me.com" }
  s.social_media_url   = "http://twitter.com/dmi3j"
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/dmi3j/DM3CheckmarkView.git", :tag => s.version.to_s }
  s.source_files = "DM3CheckmarkView/DM3CheckmarkView.{h,m}"
end
