# == Schema Information
#
# Table name: people
#
#  id         :integer         not null, primary key
#  first      :string(255)
#  last       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  phone      :string(255)
#

require 'spec_helper'

describe Person do

	let(:person) { FactoryGirl.build(:person) }

	subject { person }

	it { should respond_to(:first) }
	it { should respond_to(:last) }
	it { should respond_to(:email) }

	it { should be_valid }

	describe "name:" do
		describe "first but no last name" do
			before do
				person.last = " "
			end

			it { should be_valid }
		end

		describe "last but no first name" do
			before do
				person.first = " "
			end

			it { should be_valid }
		end

		describe "neither a first nor last name" do
			before do
				person.first = ""
				person.last = " "
			end

			it { should_not be_valid }
		end
	end

	describe "email:" do

		describe "missing" do
			before { person.email = "" }

			it { should_not be_valid }
		end

		describe "invalid" do
			before { person.email = "not@an@email.com" }

			it { should_not be_valid }
		end

		describe "duplicate email" do

			let(:person_a) { Person.new(first: "first", last: "last", email: "pERson@example.com") }
			let(:person_b) { Person.new(first: "first2", last: "last2", email: "person@example.com") }

			before do
				person_a.save
				person_b.save
			end

			it { should be_valid }

			it "should be valid" do
				person_b.should be_valid
			end
		end
	end

	describe "phone number:" do
		describe "missing" do
			before { person.phone = "" }

			it { should be_valid }
		end

		describe "present" do
			before { person.phone = "206-555-1212" }

			it { should be_valid }
		end
	end

	describe "relationships with divisons:" do
		let(:division) { Division.create(name: "division") }

		before do
			division.lead_person = person
			division.save!
		end

		it { should be_valid }

		it "should be its division's lead_person" do
			division.lead_person.should == person
		end

		describe "destruction of person" do
			before { person.destroy }

			it "should not destroy the division" do
				division.should_not be_destroyed
			end
		end

		describe "destruction of a leading division" do
			before { division.destroy }

			it { should be_destroyed }
		end

	end
end
