class AddColumnToUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :buyer
    add_column :users, :name , :string
  end
end
