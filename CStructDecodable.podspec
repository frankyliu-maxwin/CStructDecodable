Pod::Spec.new do |s|
    s.name     = 'CStructDecodable'
    s.version  = '4.0.1'
    s.license  = 'MIT'
    s.summary  = "A Light weight library to decode c struct"
    s.homepage = 'https://github.com/yume190/CStructDecodable'
    s.authors  = { 'yume190' => 'yume190@gmail.com' }
    s.social_media_url = "https://www.facebook.com/yume190"
    s.source   = { :git => 'https://github.com/yume190/CStructDecodable.git', :tag => s.version }
  
    s.ios.deployment_target = '8.0'
    s.osx.deployment_target = '10.9'
    # s.tvos.deployment_target = '9.0'
    # s.watchos.deployment_target = '2.0'
    s.source_files = ['CStructDecodable/Lib/*.swift']
  
    s.swift_version = '4'
    s.static_framework = true
  end
  