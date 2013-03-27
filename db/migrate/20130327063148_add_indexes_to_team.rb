class AddIndexesToTeam < ActiveRecord::Migration
  def change
  	add_index :teams, :division_id
	add_index :teams, :lead_person_id
	add_index :teams, :admin_user_id
  end
end
