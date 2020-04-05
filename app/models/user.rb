class User < ActiveRecord::Base
	has_many :pins

	def self.authenticate(email, password)
 		
 		@is_auth_user = User.find(email: email, password: password)
 		if @is_auth_user
 			@is_auth_user
 		else
 			@errors = "errors"
 			render :login
 		end
	end
end
