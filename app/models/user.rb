# put gem 'bcrypt' in the gemfile and bundle install
# put require 'bcrypt' in the config init.rb and bundle install

class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/, message: "Please enter a valid email address."}
end
