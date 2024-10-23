require_relative "lib/khiva/version"

Gem::Specification.new do |spec|
  spec.name          = "khiva"
  spec.version       = Khiva::VERSION
  spec.summary       = "High-performance time series algorithms for Ruby"
  spec.homepage      = "https://github.com/ankane/khiva-ruby"
  spec.license       = "MPL-2.0"

  spec.author        = "Andrew Kane"
  spec.email         = "andrew@ankane.org"

  spec.files         = Dir["*.{md,txt}", "{lib}/**/*"]
  spec.require_path  = "lib"

  spec.required_ruby_version = ">= 2.7"

  spec.add_dependency "fiddle"
end
