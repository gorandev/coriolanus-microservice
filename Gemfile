source 'https://rubygems.org'

gem 'rake', '>= 10.0'
gem 'activerecord', ENV['AR'] ? ENV['AR'].split(",") : [">= 4.2.7", "< 7.1.0", "!= 5.2.3", "!=5.2.3.rc1"]
gem 'railties', ENV['AR'] ? ENV['AR'].split(",") : [">= 4.2.7", "< 7.1.0", "!= 5.2.3", "!=5.2.3.rc1"]
gem 'typhoeus'


group :dev do
  gem 'sqlite3', ENV['SQL'] ? ENV['SQL'].split(",") : ['~> 1.4']
  gem 'rspec', '>= 2.99.0'
  gem 'jeweler'
end

