class User < ActiveRecord::Base
	has_many :pins
	validates_presence_of :first_name, :last_name, :email, :password
	validates_uniqueness_of :email
	has_secure_password
	def self.is_auth?(email, password)
		@user = User.find_by_email(email)
		if @user.present?
			if @user.authenticate(password)
				return @user
			end
		end
		return nil
	end

end
