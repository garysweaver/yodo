# -*- encoding: utf-8 -*-  
$:.push File.expand_path("../lib", __FILE__)  
require "yodo/version" 

Gem::Specification.new do |s|
  s.name        = 'yodo'
  s.version     = Yodo::VERSION
  s.authors     = ['Gary S. Weaver']
  s.email       = ['garysweaver@gmail.com']
  s.homepage    = 'https://github.com/garysweaver/yodo'
  s.summary     = %q{n+1 query avoidance with AMS.}
  s.description = %q{Determines what includes you need to avoid n+1 queries when using ActiveModel::Serializers.}
  s.files = Dir['lib/**/*'] + ['Rakefile', 'README.md']
  s.license = 'MIT'
end
