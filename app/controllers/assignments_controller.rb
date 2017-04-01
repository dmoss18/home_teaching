class AssignmentsController < ApplicationController
  def index
    params.permit :quorum_member_id
    json_response(Assignment.where(quorum_member_id: params[:quorum_member_id]))
  end
end
