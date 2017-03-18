class Assignment < ApplicationRecord
  belongs_to :quorum_member
  belongs_to :household

  class Type
    include Ruby::Enum
    define :PRIMARY, 'Primary'
    define :BACKUP, 'Backup'
  end

  validates :assignment_type, inclusion: { in: Type.values }
end
