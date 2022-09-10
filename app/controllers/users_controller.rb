class UsersController < ApplicationController

  def show
    return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
    user = User.find(session[:user_id])
    render json: user
  end

  def index
    return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
    render json: User.all

end
