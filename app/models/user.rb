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

class User < ActiveRecord::Base
	attr_accessible :name, :password, :password_confirmation, :sysadmin
	has_secure_password

	has_many :division_admins, foreign_key: "admin_user_id", class_name: "Division"

	validates :password, presence: true, length: { minimum: 4 }
	validates :password_confirmation, presence: true

end
