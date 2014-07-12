# source 'https://rubygems.org'
source 'http://ruby.taobao.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
# gem 'unicorn'
# gem 'devise'
gem 'cancan'
gem 'authlogic'
gem 'scrypt'
gem 'cancan'

gem "pry", :group => :development

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
  gem "therubyracer"
  gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
  # gem "twitter-bootstrap-rails" , '~> 2.2.8'

  # gem "twitter-bootstrap-rails"
  gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git',  branch: 'bootstrap3'
  # gem 'acts-as-taggable-on'  
  # gem 'acts-as-taggable-on', :git => 'git://github.com/mbleigh/acts-as-taggable-on.git', branch: "3.1-stable"
end

gem 'uglifier', '>= 1.0.3'
gem 'jquery-fileupload-rails'
gem 'jquery-ui-rails'
gem 'rails3-jquery-autocomplete'
gem 'gon'

gem 'acts-as-taggable-on', :git => 'git://github.com/mbleigh/acts-as-taggable-on.git', branch: "3.1-stable"

# use  ~> 3.1.0  the jquery animate will not work !!! fuck !
# gem 'jquery-rails', '~> 3.1.0'
gem 'jquery-rails'
gem 'carrierwave'
# gem 'rmagick' # fisrt  brew install imagemagick
gem 'mime-types'

gem 'simple_form', :git => "https://github.com/plataformatec/simple_form.git", branch: "v2.2"
# and  check this gist :  https://gist.github.com/tokenvolt/6599141
gem 'kaminari'

group :development, :test do
  gem "rspec-rails", "~> 2.14.0"
  gem "factory_girl_rails", "~> 4.2.1"
end

group :test do
  gem "faker", "~> 1.1.2"
  gem "capybara", "~> 2.1.0"
  gem "database_cleaner", "~> 1.0.1"
  gem "launchy", "~> 2.3.0"
  gem "selenium-webdriver", "~> 2.39.0"
end

gem 'rake', '10.3.2'
# gem 'mysql'
gem 'mysql2'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano', '2.15.5'
gem 'rvm-capistrano'
gem 'net-ssh', '~>2.7.0'

# To use debugger
# gem 'debugger'
