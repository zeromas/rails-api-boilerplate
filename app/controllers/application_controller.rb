class ApplicationController < ActionController::API
  include Respondable
  include Authenticator
  include ErrorHandler

  include Pundit::Authorization
  include Pagy::Backend
  include PagyHelper
  
  respond_to :json

  def status
    render json: { online: true }
  end
end
