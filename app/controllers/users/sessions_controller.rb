# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  include RackSessions

  respond_to :json

  private

  def respond_with(resource, _opts = {})
    render json: {
      user: UserSerializer.new(resource).serializable_hash[:data][:attributes]
    }, status: :ok
  end

  def respond_to_on_destroy
    if request.headers['Authorization'].present?
      jwt_payload = JWT.decode(request.headers['Authorization'].split(' ').last, Rails.application.credentials.devise_jwt_secret_key!).first
      resource = User.find(jwt_payload['sub'])
    end
    
    if resource
      render json: {
        message: 'Logged out successfully.'
      }, status: :ok
    else
      render json: {
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end
end
