class Fact < ApplicationRecord
  belongs_to :user
  validates :fact, length: {mininum: 5}
end
