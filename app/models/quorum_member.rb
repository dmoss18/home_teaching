class QuorumMember < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :household
  belongs_to :quorum
  has_many :assignments

  validates :user_id, uniqueness: true, if: :user_id

  class Roles
    include Ruby::Enum

    define :PRESIDENCY, 'presidency'
    define :BISHOPRIC, 'bishopric'
    define :MEMBER, 'member'
  end

  def presidency?
    role == Roles::PRESIDENCY
  end

  def bishopric?
    role == Roles::BISHOPRIC
  end

  def authority?
    presidency? || bishopric?
  end
end
