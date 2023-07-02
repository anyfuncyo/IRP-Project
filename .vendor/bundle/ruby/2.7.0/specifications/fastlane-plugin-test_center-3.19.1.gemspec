# -*- encoding: utf-8 -*-
# stub: fastlane-plugin-test_center 3.19.1 ruby lib

Gem::Specification.new do |s|
  s.name = "fastlane-plugin-test_center".freeze
  s.version = "3.19.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Lyndsey Ferguson".freeze]
  s.date = "2022-08-18"
  s.description = "  \u{1F3AF}  Understand, tame, and train your iOS & Mac tests \u{1F389}\n".freeze
  s.email = "ldf.public+github@outlook.com".freeze
  s.homepage = "https://github.com/lyndsey-ferguson/fastlane-plugin-test_center".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.6".freeze)
  s.rubygems_version = "3.4.14".freeze
  s.summary = "Makes testing your iOS app easier".freeze

  s.installed_by_version = "3.4.14" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<json>.freeze, [">= 0"])
  s.add_runtime_dependency(%q<plist>.freeze, [">= 0"])
  s.add_runtime_dependency(%q<xcodeproj>.freeze, [">= 0"])
  s.add_runtime_dependency(%q<xctest_list>.freeze, [">= 1.2.1"])
  s.add_runtime_dependency(%q<colorize>.freeze, [">= 0"])
  s.add_development_dependency(%q<cocoapods>.freeze, [">= 0"])
  s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
  s.add_development_dependency(%q<fastlane>.freeze, [">= 2.201.0"])
  s.add_development_dependency(%q<markdown-tables>.freeze, [">= 0"])
  s.add_development_dependency(%q<pry>.freeze, [">= 0"])
  s.add_development_dependency(%q<pry-byebug>.freeze, [">= 0"])
  s.add_development_dependency(%q<rake>.freeze, [">= 0"])
  s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
  s.add_development_dependency(%q<rubocop>.freeze, [">= 0"])
  s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
  s.add_development_dependency(%q<slather>.freeze, [">= 0"])
  s.add_development_dependency(%q<xcpretty-json-formatter>.freeze, [">= 0"])
end
