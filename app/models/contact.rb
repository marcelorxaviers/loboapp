class Contact < ActiveRecord::Base
  belongs_to :company

  def fullname
    "#{first_name} #{last_name}"
  end
end
