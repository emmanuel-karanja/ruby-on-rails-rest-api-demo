module ErrorHandling
    def respond_with_error(error, invalid_resource = nil)
      error = API_ERRORS[error]
      error['details'] = invalid_resource.errors.full_messages if invalid_resource
      render json: error, status: error['status']
    end
  end