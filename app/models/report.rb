class Report < ApplicationRecord
  belongs_to :assignment

  class Status
    include Ruby::Enum
    define :CONTACTED, 'Contacted'
    define :ATTEMPTED, 'Tried to contact'
    define :NO_CONTACT, 'No contact'
  end

  validates :status, inclusion: { in: Status.values }
  validates :status, :assignment_id, :household_name, presence: true
  validates :message, presence: true, unless: :no_contact?

  def no_contact?
    status == Status::NO_CONTACT
  end

  def contacted?
    status == Status::CONTACTED
  end

  def tried_to_contact?
    status == Status::ATTEMPTED
  end
end
