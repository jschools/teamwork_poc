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
#

require 'spec_helper'

describe Person do

	before do
		@person = FactoryGirl.build(:person)
	end

	subject { @person }

	it { should respond_to(:first) }
	it { should respond_to(:last) }
	it { should respond_to(:email) }

	it { should be_valid }

	describe "with a first but no last name" do
		before do
			@person.last = " "
		end

		it { should be_valid }
	end

	describe "with a last but no first name" do
		before do
			@person.first = " "
		end

		it { should be_valid }
	end

	describe "with neither a first nor last name" do
		before do
			@person.first = ""
			@person.last = " "
		end

		it { should_not be_valid }
	end

	describe "with no email" do
		before { @person.email = "" }

		it { should_not be_valid }
	end

	describe "with a bad email" do
		before { @person.email = "not@an@email.com"}
	end

	describe "with duplicate email" do

		let(:person_a) { Person.new(first: "first", last: "last", email: "person@example.com") }
		let(:person_b) { Person.new(first: "first2", last: "last2", email: "person@example.com") }

		before do
			person_a.save
			person_b.should_not be_valid
		end
	end
end
