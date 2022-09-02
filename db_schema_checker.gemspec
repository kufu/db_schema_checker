lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "db_schema_checker/version"

Gem::Specification.new do |spec|
  spec.name          = "db_schema_checker"
  spec.version       = DbSchemaChecker::VERSION
  spec.authors       = ["meganemura"]
  spec.email         = ["meganemura@users.noreply.github.com"]

  spec.summary       = "Check the consistency of generated schema.rb"
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/kufu/db_schema_checker"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake"
end
