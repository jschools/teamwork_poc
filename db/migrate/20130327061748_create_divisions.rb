class CreateDivisions < ActiveRecord::Migration
  def change
    create_table :divisions do |t|
      t.string :name
      t.integer :lead_person_id
      t.integer :admin_user_id
      t.integer :project_id

      t.timestamps
    end
  end
end
