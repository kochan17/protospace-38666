class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def up
    remove_column :users, :profile, :text if column_exists?(:users, :profile)
    remove_column :users, :occupation, :text if column_exists?(:users, :occupation)
    remove_column :users, :position, :text if column_exists?(:users, :position)

    add_column :users, :profile, :text
    add_column :users, :occupation, :text
    add_column :users, :position, :text
  end

  def down
    remove_column :users, :profile, :text
    remove_column :users, :occupation, :text
    remove_column :users, :position, :text
  end
end
