# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ec2_backup/version'

Gem::Specification.new do |spec|
  spec.name          = "ec2_backup"
  spec.version       = Ec2Backup::VERSION
  spec.authors       = ["Ben Cates"]
  spec.email         = ["ben@ideum.com"]
  spec.description   = %q{Command line tool for snapshotting ec2 instances}
  spec.summary       = %q{Command line tool for snapshotting ec2 instances}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.13"
end
