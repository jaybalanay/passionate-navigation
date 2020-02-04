class Vertical < ApplicationRecord
  include UniqueNameValidation

  ## Association
  has_many :categories

  ## Validation
  validates :name, presence: true, uniqueness: true
end
