# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "globalize_overlap_checker/version"

Gem::Specification.new do |spec|
  spec.name          = "globalize_overlap_checker"
  spec.version       = GlobalizeOverlapChecker::VERSION
  spec.authors       = ["ota42y"]
  spec.email         = ["ota42y@gmail.com"]

  spec.summary       = "raise error when duplicated tlanslate columns exist and generate remove migration"
  spec.description   = "raise error when duplicated tlanslate columns exist and generate remove migration"
  spec.homepage      = "https://ota42y.com"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "globalize", ">=5.1.0.beta1"
  spec.add_dependency "activerecord"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
end
