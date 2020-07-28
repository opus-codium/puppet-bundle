# DO NOT EDIT THIS FILE!
# This file is managed by ModuleSync.

require 'puppetlabs_spec_helper/rake_tasks'

PuppetLint.configuration.log_format = '%{path}:%{line}:%{check}:%{KIND}:%{message}' # rubocop:disable Style/FormatStringToken
PuppetLint.configuration.fail_on_warnings = true
PuppetLint.configuration.send('disable_140chars')
PuppetLint.configuration.send('disable_documentation')
exclude_paths = ['spec/**/*.pp', 'pkg/**/*.pp']
PuppetLint.configuration.ignore_paths = exclude_paths
PuppetSyntax.exclude_paths = exclude_paths

desc 'Auto-correct puppet-lint offenses'
task 'lint:auto_correct' do
  PuppetLint.configuration.fix = true
  Rake::Task[:lint].invoke
end

require 'github_changelog_generator/task'

GitHubChangelogGenerator::RakeTask.new :changelog do |config|
  pieces = `git config --get remote.origin.url`.chomp.sub(/\.git\z/, '').split(%r{/|:})
  config.user = pieces[-2]
  config.project = pieces[-1]
  config.since_tag = '1.0.0'
  config.exclude_labels = %w[ignore modulesync]
  config.future_release = ENV['FUTURE_RELEASE']
  config.unreleased = !ENV['FUTURE_RELEASE'].nil?
end
