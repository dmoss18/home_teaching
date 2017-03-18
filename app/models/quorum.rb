class Quorum < ApplicationRecord
  belongs_to :ward

  class Type
    include Ruby::Enum
    define :ELDERS, 'Elders'
    define :HIGH_PRIESTS, 'High Priests'
  end

  validates :quorum_type, inclusion: { in: Type.values }
  validates :name, :quorum_type, :ward, presence: true
end
