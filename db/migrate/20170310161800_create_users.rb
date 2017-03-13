class CreateUsers < ActiveRecord::Migration
	def change
		create_table :users do |u|
			u.string :full_name
			u.string :email
      u.string :password_digest # password encryption with bcrypt, store in salted hashed version of user password in database. Once salted and hashed, no way to decode it.

			u.timestamps
		end
	end
end
