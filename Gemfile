source 'https://rubygems.org'

gem 'rails', '3.2.6'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'awesome_print'
gem 'database_cleaner', :require => false
gem 'devise'
gem 'factory_girl_rails'
gem 'faker'
gem 'haml-rails'
#gem 'haml-scaffold'
gem 'heroku', :require => false
gem 'jquery-rails'
gem 'rails_admin', :git => 'git://github.com/sferik/rails_admin.git'
gem 'rake'
gem 'rspec-rails'
#gem 'ruby-gntp',  :require => false
gem 'stamp'
gem 'turnip' # rspec "features"
#gem 'virtus' # attributes on steroids for PORO
gem 'win32console', :platforms => [:mswin,:mingw]

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  # TODO: use bootstrap-sass-rails (convert rails_admin over first)
  gem 'bootstrap-sass'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'awesome_print'
  gem 'database_cleaner'
  unless ENV["CI"] # travis, etc
    gem 'guard-spin',   :require => false
    gem 'pry-nav'
#    gem 'ruby-debug19', :require => 'ruby-debug'
#      gem 'ruby-debug-base19x', '~> 0.11.30.pre4'
  end
  gem 'rake-hooks', :require => false
  gem "sqlite3", :platform => [:ruby, :mswin, :mingw]
  # Use table_diff directly from git until they fix
  # https://github.com/davelyon/table_diff/issues/1
  gem 'table_diff', :require => false, :git => 'git://github.com/davelyon/table_diff.git'
#  gem 'table_diff', :require => false, :path => '~/develop/gems/table_diff'
end

group :development do
  gem 'annotate', :require => false
end

group :test do
  gem 'capybara'
  gem 'cucumber-rails'
  gem 'launchy'
end

group :production do
  gem 'pg'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
