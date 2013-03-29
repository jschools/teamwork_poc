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

class Person < ActiveRecord::Base
	attr_accessible :email, :first, :last, :phone

	# Lifecycle callbacks
	before_save { |person| person.email.downcase! }

	# Validations
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validate :first_or_last
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }


	private
	def first_or_last
		if self.first.blank? && self.last.blank?
			errors[:first] << "and/or Last must be filled"
			errors[:last] << "and/or First must be filled"
		end
	end

end
