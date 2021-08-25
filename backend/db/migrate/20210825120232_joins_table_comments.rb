class JoinsTableComments < ActiveRecord::Migration[5.2]
  def change
    create_join_table :comments do |t|
      add_foreign_key :comments, :book_id
      add_foreign_key :comments, :member_id
    end
  end
end
