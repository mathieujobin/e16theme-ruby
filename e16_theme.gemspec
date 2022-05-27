
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "e16_theme/version"

Gem::Specification.new do |spec|
  spec.name          = "e16_theme"
  spec.version       = E16Theme::VERSION
  spec.authors       = ["Mathieu Jobin"]
  spec.email         = ["mathieu@justbudget.com"]

  spec.summary       = %q{E16 ThemeBall parser}
  spec.description   = %q{More than 230 Enlightenment DR16 are available.}
  spec.homepage      = "https://github.com/mathieujobin/e16theme-ruby"

  #spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  #spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  #spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.2"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "looksee"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_dependency "actionview", "> 5.2"
end
