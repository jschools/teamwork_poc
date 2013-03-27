class Team < ActiveRecord::Base
  attr_accessible :admin_user_id, :division_id, :lead_person_id, :name
end
