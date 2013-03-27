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


	validates :name, presence: true
end
