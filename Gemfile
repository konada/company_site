source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'bootstrap-sass', '~> 3.3.6'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'grape'
gem 'grape-swagger'
gem 'grape-swagger-rails'
gem 'haml', '~> 4.0'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'kaminari'
gem 'paperclip'
gem 'puma', '~> 3.0'
gem 'pundit'
gem 'rack-jsonp-middleware'
gem 'rails', '~> 5.0.1'
gem 'sass-rails', '~> 5.0'
gem 'sidekiq'
gem 'simple_form', '~> 3.3'
gem 'sqlite3'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platform: :mri

  # testing
  gem 'bullet'
  gem 'database_cleaner'
  gem 'factory_girl'
  gem 'factory_girl_rails'
  gem 'ffaker'
  gem 'rails-controller-testing'
  gem 'rspec-activejob'
  gem 'rspec-activemodel-mocks'
  gem 'rspec-rails', '~> 3.5'
  gem 'spring-commands-rspec'
  gem 'shoulda-matchers', require: false
end

group :development do
  gem 'letter_opener'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
