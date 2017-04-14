class ReportSerializer < ActiveModel::Serializer
  attributes :id, :message, :status, :household_name
  belongs_to :assignment
end
