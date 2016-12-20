# frozen_string_literal: true
require 'rubocop/rake_task'

if Rails.env.development? || Rails.env.test?
  require 'factory_girl'

  namespace :dev do
    desc 'Sample data for local development environment'
    task prime: 'db:setup' do
      include FactoryGirl::Syntax::Methods

      # create(:user, email: "user@example.com", password: "password")
    end
  end

  RuboCop::RakeTask.new(:rubocop) do |t|
    t.options = ['--display-cop-names']
  end
  task default: :rubocop
end
