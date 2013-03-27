class TeamRole < ActiveRecord::Base
  attr_accessible :person_id, :role_id, :team_id
end
