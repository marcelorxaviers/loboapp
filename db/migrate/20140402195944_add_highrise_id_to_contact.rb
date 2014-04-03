class AddHighriseIdToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :highrise_id, :Fixnum
  end
end
