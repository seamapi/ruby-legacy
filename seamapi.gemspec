# frozen_string_literal: true

require_relative "lib/seam/version"

Gem::Specification.new do |spec|
  spec.name = "seamapi"
  spec.version = Seam::VERSION
  spec.authors = ["Abimael Martell"]
  spec.email = ["abi@getseam.com"]

  spec.summary = "Seam API Ruby Library"
  spec.description = "seamapi is a Ruby gem that provides a simple interface to Seam Connect's API."
  spec.homepage = "https://github.com/seamapi/ruby"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/seamapi/ruby"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "http", "~> 5.0.0"
  spec.add_development_dependency "webmock", "~> 3.0.0"
end
