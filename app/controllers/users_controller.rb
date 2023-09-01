class UsersController < ApplicationController
  def index
    @pagy, @users = pagy(policy_scope(User))
    render json: {
      users: UserSerializer.new(@users).serializable_hash[:data].map{ |user| user[:attributes]},
      pagination: pagy_attributes(@pagy)
    }, status: :ok
  end
end
