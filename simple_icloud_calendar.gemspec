# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_icloud_calendar/version'

Gem::Specification.new do |spec|
  spec.name          = "simple_icloud_calendar"
  spec.version       = SimpleIcloudCalendar::VERSION
  spec.authors       = ["Rob Cole"]
  spec.email         = ["robcole@gmail.com"]
  spec.summary       = %q{Public iCalendar Reader}
  spec.description   = %q{Reads public calendars on iCloud}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "ice_cube"
  spec.add_dependency "icalendar"
  spec.add_dependency "activesupport"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-mocks"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "rake", "~> 10.0"
end
