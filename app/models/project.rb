# == Schema Information
#
# Table name: projects
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Project < ActiveRecord::Base
	attr_accessible :name

	has_many :divisions, dependent: :destroy

	validates :name, presence: true, uniqueness: { case_sensitive: false }
end
