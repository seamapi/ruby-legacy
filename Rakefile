# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "standard/rake"

RSpec::Core::RakeTask.new(:spec)

task default: %i[lint test]

task test: "spec"
task lint: "standard"
task format: "standard:fix"
