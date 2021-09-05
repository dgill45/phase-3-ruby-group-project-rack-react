class CreateJoinTableComments < ActiveRecord::Migration[5.2]
  def change
    create_join_table(:comments, :members) do |t|
      add_foreign_key :comment, :member_id
      add_foreign_key :comment, :book_id
    end
    
  end
end
