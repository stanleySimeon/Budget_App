class AddIndexIdToUser < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :email
  end
end
