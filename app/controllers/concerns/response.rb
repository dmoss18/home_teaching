module Response
  def json_response(object, status = :ok, params = {})
    render json: object, status: status, **params
  end

  def error_response(message, status)
    json_response({ message: message }, status)
  end

  def paginate(data)
    page = (params[:page] || 1).to_i
    per_page = params[:per_page] || 50
    paginated = data.page(page).per(per_page)
    render json: {
      data: paginated,
      meta: {
        per_page: per_page,
        current_page: page,
        total_pages: paginated.total_pages,
        total_objects: paginated.total_count
      }
    }
  end
end
