# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'DEFAULT USERS'
user = User.find_or_create_by_email :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.email
user_dummy = User.find_or_create_by_email :email => 'dummy@whatever-dummy.com', :password => 's34r8hf0qb3r7'
puts 'user: ' << user.email


puts 'DEFAULT COMPANIES'
company = Company.find_or_create_by_name :name => 'Sample A (dummy owner)', :user => user_dummy, :users => [user_dummy]
puts 'company: ' << company.name
company = Company.find_or_create_by_name :name => 'Sample B (admin as owner)', :user => user, :users => [user]
puts 'company: ' << company.name
company = Company.find_or_create_by_name :name => 'Sample C (dummy owner, admin as member)', :user => user_dummy, :users => [user_dummy, user]
puts 'company: ' << company.name
