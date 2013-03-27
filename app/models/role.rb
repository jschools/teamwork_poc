# == Schema Information
#
# Table name: roles
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Role < ActiveRecord::Base
  attr_accessible :title
end
