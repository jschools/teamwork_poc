# == Schema Information
#
# Table name: divisions
#
#  id             :integer         not null, primary key
#  name           :string(255)
#  lead_person_id :integer
#  admin_user_id  :integer
#  project_id     :integer
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#

class Division < ActiveRecord::Base
	attr_accessible :name, :project

	belongs_to :project
	belongs_to :admin_user, foreign_key: "admin_user_id", class_name: "User"
	belongs_to :lead_person, foreign_key: "lead_person_id", class_name: "Person"
	has_many :teams

	validates :name, presence: true
end
