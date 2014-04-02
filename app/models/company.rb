class Company < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :users
  has_many :contacts, dependent: :destroy
  accepts_nested_attributes_for :contacts
end
