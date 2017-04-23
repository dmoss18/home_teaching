class WardsController < ApiController
  def index
    json_response(Ward.all)
  end
end
