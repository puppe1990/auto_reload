# frozen_string_literal: true

require_relative "lib/auto_reload/version"

Gem::Specification.new do |spec|
  spec.name = "auto_reload"
  spec.version = AutoReload::VERSION
  spec.authors = ["puppe1990"]
  spec.email = ["matheus.puppe90@hotmail.com"]

  spec.summary       = "AutoReload gem for automatic browser reloading in Rails"
  spec.description   = "A gem that automatically reloads the browser when you edit and save view files in a Rails application."
  spec.homepage      = "https://github.com/puppe1990/auto_reload"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.add_dependency 'listen', '~> 3.0'
  spec.add_dependency 'faye-websocket', '~> 0.11'
  spec.add_dependency 'rack', '~> 2.2'


  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = "https://github.com/puppe1990/auto_reload"
  spec.metadata["source_code_uri"] = "https://github.com/puppe1990/auto_reload"
  spec.metadata["changelog_uri"] = "https://github.com/puppe1990/auto_reload/blob/master/CHANGELOG.md"  

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
