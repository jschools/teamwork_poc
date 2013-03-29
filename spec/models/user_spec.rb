# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  password_digest :string(255)
#  sysadmin        :boolean         default(FALSE)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

require 'spec_helper'

PW_A = "password a"
PW_B = "password b"
PW_SHORT = "pw"

describe User do

	let(:user) { User.new(name: "User Name", password: PW_A, password_confirmation: PW_A) }

	subject { user }

	it { should be_valid }
	it { should_not be_sysadmin }

	describe "with missing name" do
		before { user.name = " " }
		it { should_not be_valid }
	end

	describe "with missing password" do
		before { user.password = "" }
		it { should_not be_valid }
	end

	describe "with missing password_confirmation" do
		before { user.password_confirmation = "" }
		it { should_not be_valid }
	end

	describe "with no passwords" do
		before { user.password = user.password_confirmation = "" }
		it { should_not be_valid }
	end

	describe "with mismatched passwords" do
		before do
			user.password = PW_A
			user.password_confirmation = PW_B
		end

		it { should_not be_valid }
	end

	describe "with short password" do
		before do
			user.password = PW_SHORT
			user.password_confirmation = PW_SHORT
		end

		it { should_not be_valid }
	end

	describe "trying to set sysadmin" do
		it "should cause an exception" do
			expect do
				User.new(sysadmin: true)
			end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
		end
	end

	describe "relationships with divisions" do
		let(:division) { Division.create(name: "Division") }

		before do
			division.admin_user = user
			division.save!
		end

		it { should be_valid }
		its(:division) { should == division }
		its(:team) { should be_nil }

		describe "destruction of division" do
			before { division.destroy }

			it { should_not be_destroyed }
			its(:division) { should be_nil }
		end

		describe "destruction of user" do
			before { user.destroy }

			it "should not destroy its division" do
				division.should_not be_destroyed
			end
		end
	end

	describe "relationships with teams" do
		let(:team) { Team.create(name: "Team") }

		before do
			team.admin_user = user
			team.save!
		end

		it { should be_valid }
		its(:division) { should be_nil }
		its(:team) { should == team }

		describe "destruction of team" do
			before { team.destroy }

			it { should_not be_destroyed }
			its(:team) { should be_nil }
		end

		describe "destruction of user" do
			before { user.destroy }

			it "should not destroy its team" do
				team.should_not be_destroyed
			end
		end
	end

end
