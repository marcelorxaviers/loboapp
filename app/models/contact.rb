class Contact < ActiveRecord::Base
	#validates :name, :presence => :true
	validates :name, :length => { :in => 5..10 }, :format => /\d+/
	validates :name, :uniqueness => { :case_sensitive => true }
end
