class AssignmentsController < ApiController
  def index
    authorize Assignment
    valid_params = params.permit :quorum_member_id
    json_response(Assignment.where(quorum_member_id: params[:quorum_member_id]))
  end

  def create
    valid_params = params.permit :household_id, :quorum_member_id
    json_response(Assignment.create(valid_params), :created)
  end
end
