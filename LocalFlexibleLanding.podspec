Pod::Spec.new do |s|

  s.name             = 'LocalFlexibleLanding'
  s.version          = '0.2.0'
  s.summary          = 'Manager for complex in-app purchase logic'

  s.description      = 'This framework allows you to create complex navigation flow for different landings.'

  s.homepage         = 'https://github.com/Pimine/LocalFlexibleLanding.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.authors          = { 'Den Andreychuk' => 'business@denandreychuk.com' }

  s.source 	         = { 
    :git => 'https://github.com/Pimine/LocalFlexibleLanding.git', 
    :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'

  s.swift_version   = ['5.4', '5.5']
  s.source_files    = 'Sources/**/*.swift'

end
