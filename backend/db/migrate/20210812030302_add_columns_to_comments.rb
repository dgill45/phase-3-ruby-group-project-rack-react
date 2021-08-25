class AddColumnsToComments < ActiveRecord::Migration[5.2]
  def change
    change_table :comments do |t|
      t.integer :member_id
      t.integer :book_id
    end
  end
end
