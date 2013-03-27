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

require 'spec_helper'

describe Team do
  pending "add some examples to (or delete) #{__FILE__}"
end
