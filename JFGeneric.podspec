Pod::Spec.new do |s|

  s.name            = 'JFGeneric'
  s.version         = '0.0.1'
  s.summary         = 'A generic swift base package'

  s.homepage        = 'https://github.com/hxwxww/JFGeneric.git'
  s.license         = 'MIT'

  s.author          = { 'hxwxww' => 'hxwxww@163.com' }
  s.platform        = :ios, '8.0'
  s.swift_version   = '5.0'

  s.source          = { :git => 'https://github.com/hxwxww/JFGeneric.git', :tag => s.version }

  s.source_files    = 'Sources/**/*.swift'

  s.frameworks      = 'Foundation', 'UIKit'

end
