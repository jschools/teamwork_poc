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
	attr_accessible :admin_user_id, :lead_person_id, :name, :project_id

	belongs_to :project

	validates :name, presence: true
end
