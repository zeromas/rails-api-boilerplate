# frozen_string_literal: true

class CurrentUsersController < ApplicationController

  def show
    render json: {
      user: UserSerializer.new(current_user).serializable_hash[:data][:attributes]
    }, status: :ok
  end
end
