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
  attr_accessible :admin_user_id, :division_id, :lead_person_id, :name
end
