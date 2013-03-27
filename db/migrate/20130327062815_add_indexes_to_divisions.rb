class AddIndexesToDivisions < ActiveRecord::Migration
  def change
  	add_index :divisions, :lead_person_id
    add_index :divisions, :admin_user_id
    add_index :divisions, :project_id
  end
end
