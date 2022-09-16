class AddNameAndAmountToPayment < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :name, :string
    add_column :payments, :amount, :decimal
    add_reference :payments, :user, null: false, foreign_key: true
    add_reference :payments, :category, null: false, foreign_key: true
  end
end
