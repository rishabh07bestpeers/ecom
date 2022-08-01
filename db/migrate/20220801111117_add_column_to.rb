class AddColumnTo < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :user_type
    add_column :users, :buyer, :boolean, default: :false
    add_column :users, :seller, :boolean, default: :false
  end
end
