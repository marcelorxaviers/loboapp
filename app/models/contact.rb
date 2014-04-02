class Contact < ActiveRecord::Base
  include HighriseWrapper::ActiveRecord

  belongs_to :company

  def fullname
    "#{first_name} #{last_name}"
  end

  def highrise_hash
  {
    'first_name' => first_name,
    'last_name' => last_name,
    'title' => job_title,
    'company_name' => company_name,
    'contact_data' =>  {
      'email_addresses' => [{
        'address' => email,
        'location' => 'Work'
      }],
      'phone_numbers' => [{
        'number' => phone,
        'location' => 'Work'
      }],
      'web_addresses' => [{
        'location' => 'Work',
        'url' => website
      }]
    }
  }
  end

  def highrise_token
    company.highrise_token
  end

  def highrise_base_url
    company.highrise_base_url
  end
end
