# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sightengine/version'

Gem::Specification.new do |spec|
  spec.name          = "sightengine-ruby"
  spec.version       = Sightengine::VERSION
  spec.authors       = ["Jay Zeschin"]
  spec.email         = ["jay@ello.co"]

  spec.summary       = %q{Ruby wrapper for the SightEngine image moderation API}
  spec.homepage      = "https://github.com/ello/sightengine-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "dotenv"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
end
