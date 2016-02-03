class AddAdminIdToPins < ActiveRecord::Migration
  def change
    add_column :pins, :admin_id, :integer
    add_index :pins, :admin_id
  end
end
