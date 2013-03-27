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

require 'spec_helper'

describe TeamRole do
  pending "add some examples to (or delete) #{__FILE__}"
end
