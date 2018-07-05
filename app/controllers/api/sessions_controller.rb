#class SessionsController < Devise::SessionsController
class Api::SessionsController < ::Devise::SessionsController
  before_action :authenticate_user!

  skip_before_action :verify_authenticity_token
  respond_to :json

  def create
    super { @token = current_token }
  end

  def show
  end

  private

  def current_token
    request.env['warden-jwt_auth.token']
  end
end
