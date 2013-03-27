class CreateTeamRoles < ActiveRecord::Migration
  def change
    create_table :team_roles do |t|
      t.integer :team_id
      t.integer :person_id
      t.integer :role_id

      t.timestamps
    end

    add_index :team_roles, :team_id
    add_index :team_roles, :person_id
    add_index :team_roles, :role_id
    add_index :team_roles, [:team_id, :person_id, :role_id], unique: true
  end
end
