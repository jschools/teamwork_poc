# == Schema Information
#
# Table name: projects
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

PROJECT_1 = "Project 1"
PROJECT_2 = "Project 2"
DIVISION_1 = "Division 1"
DIVISION_2 = "Division 2"
DIVISION_3 = "Division 3"
DIVISION_4 = "Division 4"

describe Project do

	let(:project) { Project.new(name: PROJECT_1) }

	subject { project }

	it { should be_valid }
	it { should respond_to(:name) }
	its(:name) { should == PROJECT_1 }

	describe "with no name" do
		before { project.name = " " }
		it { should_not be_valid }
	end

	describe "with no divisions" do
		before { project.save! }

		it { should have(0).divisions }

		it "when adding a division" do
			expect do
				project.divisions.create(name: DIVISION_1)
			end.to change(project.divisions, :count).by(1)
		end

	end

	describe "destroying" do
		let(:project_2) { Project.new(name: PROJECT_2) }
		let(:div_1) { Division.new(name: DIVISION_1) }
		let(:div_2) { Division.new(name: DIVISION_2) }

		before do
			project.divisions << div_1 << div_2
			project.save!
		end

		it { should have(2).divisions }

		describe "itself" do
			before { project.destroy }

			it "should destroy child divisions" do
				Division.count.should == 0
			end
		end

		describe "a different project" do
			let(:div_3) { Division.new(name: DIVISION_3) }
			let(:div_4) { Division.new(name: DIVISION_4) }

			before do
				project_2.divisions << div_3 << div_4
				project_2.save!

				project_2.destroy
			end

			it "should not destroy its child divisions" do
				Division.count.should == 2
				Division.all.should include(div_1, div_2)
				Division.all.should_not include(div_3, div_4)
			end
		end

	end

end
