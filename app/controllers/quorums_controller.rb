class QuorumsController < ApiController
  def index
    valid_params = params.permit :ward_id
    json_response(Quorum.where(ward_id: params[:ward_id]))
  end
end
