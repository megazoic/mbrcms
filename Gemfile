source 'https://rubygems.org'

gem 'sassc', '>= 2'
gem 'tilt', '>= 2.0.9'
gem 'erubi', '>= 1.5'
gem 'roda', '>= 3.57'
gem 'refrigerator', '>= 1'
gem 'sequel', '>= 5.59'
#gem 'sequel_pg', '>= 1.8', require: 'sequel'
#had difficulties installing sequel_pg so used
#gem install pg -- --with-pg-config=/opt/local/lib/postgresql14/bin/pg_config
#from the command line (pg-1.4.5 was installed)
gem 'rack-unreloader', '>= 1.8'
gem 'rake'

group :development do
  gem 'sequel-annotate'
  gem 'simplecov'
end

group :test do
  gem 'capybara'
  gem 'minitest', '>= 5.7.0'
  gem 'minitest-hooks', '>= 1.1.0'
  gem "minitest-global_expectations"
end
