## Capistrano Semantic Version Git Tags

A Capistrano plugin for adding a semantic version Git tag at each deployment, automatically.

### Usage

capistrano-semver-git-tags is available on [rubygems.org](https://rubygems.org/gems/capistrano-semver-git-tags).
In keeping with the pattern used by Capistrano itself and other plugins, add it
to the `development` group of your Gemfile with `require: false`:

```ruby
# Gemfile
group :development do
  gem 'capistrano-semver-git-tags', require: false
end
```

Then require `capistrano/semver-tag` in your Capfile

```
# Capfile
require 'capistrano/semver-tag'
```

This will allow you to use one of three tasks:

For bug fixes
```shell
bundle exec cap production deploy:patch
```

For new features
```shell
bundle exec cap production deploy:minor
```

For major changes that break backward compatibility
```shell
bundle exec cap production deploy:major
```