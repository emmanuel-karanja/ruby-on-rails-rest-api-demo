class Fact < ApplicationRecord
  belongs_to :user
  validates :fact, length: {mininum: 5, message: "fact must be at least 5 characters"},uniqueness: true
end
