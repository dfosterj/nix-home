# -*- encoding: utf-8 -*-
# stub: rubygems-update 3.6.3 ruby hide_lib_for_update

Gem::Specification.new do |s|
  s.name = "rubygems-update".freeze
  s.version = "3.6.3".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/rubygems/rubygems/issues", "changelog_uri" => "https://github.com/rubygems/rubygems/blob/master/CHANGELOG.md", "funding_uri" => "https://rubycentral.org/#/portal/signup", "source_code_uri" => "https://github.com/rubygems/rubygems" } if s.respond_to? :metadata=
  s.require_paths = ["hide_lib_for_update".freeze]
  s.authors = ["Jim Weirich".freeze, "Chad Fowler".freeze, "Eric Hodel".freeze, "Luis Lavena".freeze, "Aaron Patterson".freeze, "Samuel Giddins".freeze, "Andr\u00E9 Arko".freeze, "Evan Phoenix".freeze, "Hiroshi SHIBATA".freeze]
  s.bindir = "exe".freeze
  s.date = "2025-01-16"
  s.description = "A package (also known as a library) contains a set of functionality\n  that can be invoked by a Ruby program, such as reading and parsing an XML file. We call\n  these packages 'gems' and RubyGems is a tool to install, create, manage and load these\n  packages in your Ruby environment. RubyGems is also a client for RubyGems.org, a public\n  repository of Gems that allows you to publish a Gem that can be shared and used by other\n  developers. See our guide on publishing a Gem at guides.rubygems.org".freeze
  s.email = ["".freeze, "".freeze, "drbrain@segment7.net".freeze, "luislavena@gmail.com".freeze, "aaron@tenderlovemaking.com".freeze, "segiddins@segiddins.me".freeze, "andre@arko.net".freeze, "evan@phx.io".freeze, "hsbt@ruby-lang.org".freeze]
  s.executables = ["update_rubygems".freeze]
  s.extra_rdoc_files = ["LICENSE.txt".freeze, "doc/MAINTAINERS.txt".freeze, "MIT.txt".freeze, "Manifest.txt".freeze, "README.md".freeze, "doc/rubygems/UPGRADING.md".freeze, "doc/rubygems/POLICIES.md".freeze, "CODE_OF_CONDUCT.md".freeze, "doc/rubygems/CONTRIBUTING.md".freeze, "bundler/LICENSE.md".freeze, "bundler/README.md".freeze, "hide_lib_for_update/note.txt".freeze, "bundler/lib/bundler/man/bundle-add.1".freeze, "bundler/lib/bundler/man/bundle-binstubs.1".freeze, "bundler/lib/bundler/man/bundle-cache.1".freeze, "bundler/lib/bundler/man/bundle-check.1".freeze, "bundler/lib/bundler/man/bundle-clean.1".freeze, "bundler/lib/bundler/man/bundle-config.1".freeze, "bundler/lib/bundler/man/bundle-console.1".freeze, "bundler/lib/bundler/man/bundle-doctor.1".freeze, "bundler/lib/bundler/man/bundle-env.1".freeze, "bundler/lib/bundler/man/bundle-exec.1".freeze, "bundler/lib/bundler/man/bundle-fund.1".freeze, "bundler/lib/bundler/man/bundle-gem.1".freeze, "bundler/lib/bundler/man/bundle-help.1".freeze, "bundler/lib/bundler/man/bundle-info.1".freeze, "bundler/lib/bundler/man/bundle-init.1".freeze, "bundler/lib/bundler/man/bundle-inject.1".freeze, "bundler/lib/bundler/man/bundle-install.1".freeze, "bundler/lib/bundler/man/bundle-issue.1".freeze, "bundler/lib/bundler/man/bundle-licenses.1".freeze, "bundler/lib/bundler/man/bundle-list.1".freeze, "bundler/lib/bundler/man/bundle-lock.1".freeze, "bundler/lib/bundler/man/bundle-open.1".freeze, "bundler/lib/bundler/man/bundle-outdated.1".freeze, "bundler/lib/bundler/man/bundle-platform.1".freeze, "bundler/lib/bundler/man/bundle-plugin.1".freeze, "bundler/lib/bundler/man/bundle-pristine.1".freeze, "bundler/lib/bundler/man/bundle-remove.1".freeze, "bundler/lib/bundler/man/bundle-show.1".freeze, "bundler/lib/bundler/man/bundle-update.1".freeze, "bundler/lib/bundler/man/bundle-version.1".freeze, "bundler/lib/bundler/man/bundle-viz.1".freeze, "bundler/lib/bundler/man/bundle.1".freeze]
  s.files = ["CODE_OF_CONDUCT.md".freeze, "LICENSE.txt".freeze, "MIT.txt".freeze, "Manifest.txt".freeze, "README.md".freeze, "bundler/LICENSE.md".freeze, "bundler/README.md".freeze, "bundler/lib/bundler/man/bundle-add.1".freeze, "bundler/lib/bundler/man/bundle-binstubs.1".freeze, "bundler/lib/bundler/man/bundle-cache.1".freeze, "bundler/lib/bundler/man/bundle-check.1".freeze, "bundler/lib/bundler/man/bundle-clean.1".freeze, "bundler/lib/bundler/man/bundle-config.1".freeze, "bundler/lib/bundler/man/bundle-console.1".freeze, "bundler/lib/bundler/man/bundle-doctor.1".freeze, "bundler/lib/bundler/man/bundle-env.1".freeze, "bundler/lib/bundler/man/bundle-exec.1".freeze, "bundler/lib/bundler/man/bundle-fund.1".freeze, "bundler/lib/bundler/man/bundle-gem.1".freeze, "bundler/lib/bundler/man/bundle-help.1".freeze, "bundler/lib/bundler/man/bundle-info.1".freeze, "bundler/lib/bundler/man/bundle-init.1".freeze, "bundler/lib/bundler/man/bundle-inject.1".freeze, "bundler/lib/bundler/man/bundle-install.1".freeze, "bundler/lib/bundler/man/bundle-issue.1".freeze, "bundler/lib/bundler/man/bundle-licenses.1".freeze, "bundler/lib/bundler/man/bundle-list.1".freeze, "bundler/lib/bundler/man/bundle-lock.1".freeze, "bundler/lib/bundler/man/bundle-open.1".freeze, "bundler/lib/bundler/man/bundle-outdated.1".freeze, "bundler/lib/bundler/man/bundle-platform.1".freeze, "bundler/lib/bundler/man/bundle-plugin.1".freeze, "bundler/lib/bundler/man/bundle-pristine.1".freeze, "bundler/lib/bundler/man/bundle-remove.1".freeze, "bundler/lib/bundler/man/bundle-show.1".freeze, "bundler/lib/bundler/man/bundle-update.1".freeze, "bundler/lib/bundler/man/bundle-version.1".freeze, "bundler/lib/bundler/man/bundle-viz.1".freeze, "bundler/lib/bundler/man/bundle.1".freeze, "doc/MAINTAINERS.txt".freeze, "doc/rubygems/CONTRIBUTING.md".freeze, "doc/rubygems/POLICIES.md".freeze, "doc/rubygems/UPGRADING.md".freeze, "exe/update_rubygems".freeze, "hide_lib_for_update/note.txt".freeze]
  s.homepage = "https://guides.rubygems.org".freeze
  s.licenses = ["Ruby".freeze, "MIT".freeze]
  s.rdoc_options = ["--main".freeze, "README.md".freeze, "--title=RubyGems Update Documentation".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.1.0".freeze)
  s.rubygems_version = "3.6.3".freeze
  s.summary = "RubyGems is a package management framework for Ruby. This gem is downloaded and installed by `gem update --system`, so that the `gem` CLI can update itself.".freeze

  s.installed_by_version = "3.5.22".freeze
end
