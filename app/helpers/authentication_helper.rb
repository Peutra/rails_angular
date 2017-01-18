module AuthenthicationHelper
  def validate_token!
    begin
      TokenProvider.valid?(token)
    rescue
      error!('Unauthorized', 401)
    end
  end

  def authenticate!
    begin
       # if payload and header true
      payload, header = TokenProvider.valid?(token)
      @current_user = User.find_by(id: payload['user_id'])
    rescue
      error!('Unauthorized', 401)
    end
  end

  def current_user
    # current @current_user equals result of authenticate if @current_user equals nil
    # else change nothing
    @current_user ||= authenticate!
  end

  def token
    request.headers ['Authorization'].split(' ').last
  end
end
