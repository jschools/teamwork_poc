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

require 'spec_helper'

describe Division do
  pending "add some examples to (or delete) #{__FILE__}"
end
