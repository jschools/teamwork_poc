FactoryGirl.define do
	factory :person do
		sequence(:first) { |n| "First#{n}" }
		sequence(:last)  { |n| "Last#{n}" }
		sequence(:email) { |n| "person_#{n}@example.com" }
	end

end