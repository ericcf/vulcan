source 'https://rubygems.org'

RAILS_VERSION = '~> 3.2.3'
DM_VERSION    = '~> 1.2.0'

gem 'activesupport',  RAILS_VERSION, :require => 'active_support'
gem 'actionpack',     RAILS_VERSION, :require => 'action_pack'
gem 'actionmailer',   RAILS_VERSION, :require => 'action_mailer'
gem 'railties',       RAILS_VERSION, :require => 'rails'
gem 'tzinfo',         '~> 0.3.32'

gem 'dm-rails',               '~> 1.2.1'
gem 'dm-postgres-adapter', DM_VERSION

gem 'dm-migrations',   DM_VERSION
gem 'dm-types',        DM_VERSION
gem 'dm-validations',  DM_VERSION
#gem 'dm-constraints',  DM_VERSION
#gem 'dm-transactions', DM_VERSION
gem 'dm-aggregates',   DM_VERSION
gem 'dm-timestamps',   DM_VERSION
gem 'dm-observer',     DM_VERSION

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'less'
  gem 'therubyracer', platform: :ruby
end

gem 'simple_form'
gem 'twitter-bootstrap-rails'
gem 'jquery-rails', '~> 2.0.1'
gem 'uglifier'
gem 'whenever'

group :development do
  gem 'debugger', require: 'ruby-debug'
  gem 'capistrano', '~> 2.11.2'
  gem 'rvm-capistrano'
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'growl'
end

group :test do
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'capybara-webkit'
end
