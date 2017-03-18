class WardsController < ApplicationController
  def index
    json_response(Ward.all)
  end
end
