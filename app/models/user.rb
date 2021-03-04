class User < ApplicationRecord
     has_secure_password
     validates :username,length: {in: 2..40,message: "username must be at least 2 characters long"}
     validates :password,length: {in: 6..50.message: "password must be at least 6 characters long"}
end
