require 'spec/rake/spectask'

namespace :spec do
  desc "Start Autotest"
  task :autotest do
    require './spec/rspec_autotest'
    RspecAutotest.run
  end
end

desc "Run specs"
Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = %w(-fs --color)
end