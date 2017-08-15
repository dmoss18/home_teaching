class QuorumMembersController < ApiController
  def index
    valid_params = params.permit :quorum_id
    paginate QuorumMember.where(quorum_id: valid_params[:quorum_id]).order(:last_name)
  end

  def search # TODO: Use a better search framework (ransack?)
    valid_params = params.permit :quorum_id, :name
    quorum_id = valid_params[:quorum_id]
    name = QuorumMember.sanitize("#{valid_params[:name]}%")
    query = [
      "first_name like #{name}",
      "last_name like #{name}"
      ].join(' OR ')
    json_response(
      QuorumMember.where(quorum_id: quorum_id).where(query).order(:last_name), :ok, { each_serializer: QuorumMemberBaseSerializer }
    )
  end

  def update
    valid_params = params.permit :user_id, :first_name, :last_name, :quorum_id, :household_id
    quorum_member = QuorumMember.find(params[:id])

    if quorum_member.user_id && valid_params[:user_id] && quorum_member.user_id != valid_params[:user_id].to_i
      error_response('This member is already linked to a different user', :bad_request)
    else
      quorum_member.update!(valid_params)
      json_response quorum_member
    end
  end
end
