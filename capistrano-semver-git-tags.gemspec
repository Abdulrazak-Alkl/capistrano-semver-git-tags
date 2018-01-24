Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'capistrano-semver-git-tags'
  s.version     = '0.0.1'
  s.summary     = 'Tag your deployed commit to git with semantic versioning'

  s.files       = `git ls-files lib`.split(/\n/) + %w{ README.md LICENSE }

  s.authors     = ['AbdulRazzak Alkel']
  s.email       = ['abdulrazaqalkl@gmail.com']
  s.date        = '2018-01-23'
  s.homepage    = 'https://github.com/Abdulrazak-Alkl/capistrano-semver-git-tags'

  s.add_dependency('capistrano', ['>= 1.0.0'])

  s.has_rdoc = false
end
