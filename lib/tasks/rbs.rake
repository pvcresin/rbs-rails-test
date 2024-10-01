# frozen_string_literal: true

require "rbs_rails/rake_task"
require "listen"

RbsRails::RakeTask.new do |task|
  # If you want to avoid generating RBS for some classes, comment in it.
  # default: nil
  #
  # task.ignore_model_if = -> (klass) { klass == MyClass }

  # If you want to change the rake task namespace, comment in it.
  # default: :rbs_rails
  # task.name = :cool_rbs_rails

  # If you want to change where RBS Rails writes RBSs into, comment in it.
  # default: Rails.root / 'sig/rbs_rails'
  # task.signature_root_dir = Rails.root / 'my_sig/rbs_rails'
end

namespace :rbs do
  task setup: %i[collection rbs_rails:all inline]
  task update: %i[rbs_rails:all inline]
  task reset: %i[clean setup]

  task :collection do
    sh "rbs collection install --frozen"
  end

  task :inline do
    sh "bundle exec rbs-inline --output --opt-out app lib"
  end

  task :watch do
    Rake::Task["rbs:inline"].execute
    listener = Listen.to("app", "lib") do |modified, added, removed|
      relevant_changes = (modified + added + removed).select { |file| file.end_with?(".rb") }
      unless relevant_changes.empty?
        Rake::Task["rbs:inline"].execute
      end
    end
    listener.start
    sleep
  end

  task :validate do
    sh "bundle exec steep validate"
  end

  task :type_check do
    sh "bundle exec steep check"
  end

  task :clean do
    sh "rm -rf .gem_rbs_collection/ sig/rbs_rails/ sig/generated/"
  end
end
