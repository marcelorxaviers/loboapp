class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :highrise_base_url
      t.string :highrise_token
      t.references :user, index: true

      t.timestamps
    end
  end
end
