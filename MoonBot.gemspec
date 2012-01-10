# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "MoonBot/version"

Gem::Specification.new do |s|
  s.name        = "MoonBot"
  s.version     = MoonBot::VERSION
  s.authors     = ["Blake Williams"]
  s.email       = ["blake@baristadesign.com"]
  s.homepage    = "https://github.com/BlakeWilliams/MoonBot"
  s.summary     = %q{Amazingly simple IRC bot.}
  s.description = %q{Amazingly simple IRC bot that handles everything via plugins with the exception of connecting.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "eventmachine"
end
