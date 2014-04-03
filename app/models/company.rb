class Company < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :users
  has_many :contacts, dependent: :destroy
  accepts_nested_attributes_for :contacts

  validates_length_of :name, :minimum => 3, :maximum => 30, :allow_blank => false
  validates_length_of :highrise_token, :minimum => 30, :maximum => 35, :allow_blank => false
  validates_format_of :highrise_base_url, :with => URI.regexp
end
