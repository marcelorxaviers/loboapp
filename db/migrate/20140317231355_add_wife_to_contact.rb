class AddWifeToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :wife, :string
  end
end
