module Authenticator
  extend ActiveSupport::Concern
  
  included do
    before_action :authenticate_user!
    skip_before_action :authenticate_user!, if: :devise_controller?
    skip_before_action :authenticate_user!, only: :status
  end
end
