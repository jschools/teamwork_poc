class RemoveUniqueConstraintFromPersonEmail < ActiveRecord::Migration
  def change
  	remove_index :people, column: :email
  	add_index :people, :email
  end
end
