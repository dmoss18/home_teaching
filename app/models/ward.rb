class Ward < ApplicationRecord
  validates :name, presence: true

  has_many :quorums
end
