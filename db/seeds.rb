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
companyA = Company.find_or_create_by_name :name => 'Sample A (dummy owner)', :user => user_dummy, :users => [user_dummy]
puts 'company: ' << companyA.name
companyB = Company.find_or_create_by_name :name => 'Sample B (admin as owner)', :user => user, :users => [user]
puts 'company: ' << companyB.name
companyC = Company.find_or_create_by_name :name => 'Sample C (dummy owner, admin as member)', :user => user_dummy, :users => [user_dummy, user]
puts 'company: ' << companyC.name


puts 'DEFAULT CONTACTS'
contact_a1 = Contact.find_or_create_by_email("aaa@nohere.com.bs") do |c|
	c.first_name = "Astolfo" 
	c.last_name = "Aguiar"
	c.company_name = "AspasCorp"
	c.job_title = "Auxiliar"
	c.phone = ""
	c.website = ""
	c.company = companyA
end
companyA.contacts << contact_a1
puts 'contact: ' << contact_a1.fullname
contact_b1 = Contact.find_or_create_by_email("b1@nohere.com.bs") do |c|
	c.first_name = "Brasticole" 
	c.last_name = "Barrone"
	c.company_name = "BravoCorp"
	c.job_title = "Blasfemiador"
	c.phone = ""
	c.website = ""
	c.company = companyB
end
companyB.contacts << contact_b1
puts 'contact: ' << contact_b1.fullname
contact_b2 = Contact.find_or_create_by_email("b2@nohere.com.bs") do |c|
	c.first_name = "Bartolomeu" 
	c.last_name = "Buscopanoide"
	c.company_name = "Berscuponi"
	c.job_title = "Bartender"
	c.phone = ""
	c.website = ""
	c.company = companyB
end
companyB.contacts << contact_b2
puts 'contact: ' << contact_b2.fullname