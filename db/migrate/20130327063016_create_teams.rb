class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :division_id
      t.integer :lead_person_id
      t.integer :admin_user_id

      t.timestamps
    end
  end
end
