class User < ApplicationRecord
     has_secure_password
     validates :username,length: {in: 2..40}
     validates :password,length: {in: 6..50}
end
