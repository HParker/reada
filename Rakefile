# frozen_string_literal: true

# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks
task(:default).clear
task default: %i[spec rubocop]

if defined? RSpec
  task(:spec).clear
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.verbose = false
  end

  RuboCop::RakeTask.new(:rubocop) do |t|
    t.options = ['--display-cop-names', '--rails', '-c.rubocop.yml']
  end
end

task :import_json => :environment do
  json = JSON.parse(File.open("podcasts.json").read)
  json["results"].each do |result|
    puts result["feedUrl"]
    feed = Feed.new(url: result["feedUrl"])
    feed.save!
  end

end


task default: 'bundler:audit'
