# == Schema Information
#
# Table name: team_roles
#
#  id         :integer         not null, primary key
#  team_id    :integer
#  person_id  :integer
#  role_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class TeamRole < ActiveRecord::Base

	belongs_to :person
	belongs_to :team
	belongs_to :role

end
