class User < ActiveRecord::Base
	has_many :pins
	validates_presence_of :first_name, :last_name, :email, :password
	validates_uniqueness_of :email
	def self.is_auth?(email, password)
		user = User.where(email: email).first
		if user.present?
			if password === user.password
				0
			else
			  	1
			end
		else
			2
		end
	end

end
