# == Schema Information
#
# Table name: teams
#
#  id             :integer         not null, primary key
#  name           :string(255)
#  division_id    :integer
#  lead_person_id :integer
#  admin_user_id  :integer
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#

class Team < ActiveRecord::Base
	attr_accessible :name

	belongs_to :division
	belongs_to :admin_user, foreign_key: "admin_user_id", class_name: "User"
	has_many :team_roles

	validates :name, presence: true
end
