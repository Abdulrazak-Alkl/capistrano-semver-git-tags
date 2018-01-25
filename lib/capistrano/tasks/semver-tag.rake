require 'capistrano'

namespace :deploy do

  before :set_current_revision, :semver_tag do
    invoke 'git:tags:push_deploy_tag' unless fetch(:semantic_version).nil?
  end

  task :major do
    set :semantic_version, :major
    invoke :deploy
  end

  task :minor do
    set :semantic_version, :minor
    invoke :deploy
  end

  task :patch do
    set :semantic_version, :patch
    invoke :deploy
  end

end

namespace :git do

  namespace :tags do

    desc "Place semantic version tag into Git and push it to server."
    task :push_deploy_tag do
      puts `git fetch --tags`
      last_commit_tag = `git describe --exact-match --tags HEAD`.chomp
      if last_commit_tag.empty?
        old_tag = `git tag --sort version:refname | tail -n1`.chomp
        if old_tag.nil? || old_tag.empty?
          old_tag = '0.0.0'
        end
        major, minor, patch = old_tag.split('.')
        case fetch(:semantic_version)
          when :major
            major = major.to_i + 1
            minor = 0
            patch = 0
          when :minor
            minor = minor.to_i + 1
            patch = 0
          when :patch
            patch = patch.to_i + 1
        end
        new_tag = "#{major}.#{minor}.#{patch}"
        user  = `git config --get user.name`.chomp
        email = `git config --get user.email`.chomp
        puts `git tag #{new_tag} -m "Deployed by #{user} <#{email}>"`
        puts `git push --tags origin`
      else
        puts "The release you are trying to deploy already has semantic version (#{last_commit_tag})"
      end
    end

  end

end