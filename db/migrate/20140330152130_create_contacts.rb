class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.belongs_to :company, index: true
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :company_name
      t.string :job_title
      t.string :phone
      t.string :website

      t.timestamps
    end
  end
end
