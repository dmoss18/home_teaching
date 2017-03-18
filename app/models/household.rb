class Household < ApplicationRecord
  validates :name, :ward, presence: true

  belongs_to :ward
end
