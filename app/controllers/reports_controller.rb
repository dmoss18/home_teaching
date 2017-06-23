class ReportsController < ApiController
  def create
    valid_params = params.permit :assignment_id, :message, :status, :household_name, :period
    json_response Report.create!(valid_params), :created
  end
end
