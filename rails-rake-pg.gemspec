lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'rails-rake-pg/version'

Gem::Specification.new do |s|
  s.name        = "rails-rake-pg"
  s.version     = RailsRakePg::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["bpo"]
  s.email       = ["bpo@somnambulance.net"]
  s.homepage    = "http://github.com/bpo/rails-rake-pg"
  s.summary     = "Postgres tasks for Rails"
  s.description = s.summary + "."
 
  s.add_dependency "rails"
 
  s.files        = Dir.glob("lib/**/*") + ["README.markdown"]
  s.require_path = 'lib'
end
