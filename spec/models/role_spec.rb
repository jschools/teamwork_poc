# == Schema Information
#
# Table name: roles
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

ROLE_1 = "Role 1"

describe Role do
	let(:role) { Role.new(title: ROLE_1) }

	subject { role }

	it { should be_valid }

	describe "with no title" do
		before { role.title = " " }

		it { should_not be_valid }
	end
end
