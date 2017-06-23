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

  scope :this_month, -> { where(period: Date.today.beginning_of_month..Date.today.end_of_month) }
  scope :previous_month, -> {
    previous = Date.today - 1.month
    where(period: previous.beginning_of_month..previous.end_of_month)
  }

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
