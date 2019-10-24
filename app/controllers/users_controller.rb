# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :user?, only: %i[update destroy]

  def index
    @users = User.all

    p = params[:page].to_i <= 0 ? 1 : params[:page].to_i
    @users = @users.paginate(page: p, per_page: 25)

    response.headers['pagination'] = {
      total_pages: @users.total_pages,
      current_page: @users.current_page.to_i
    }.to_json
    render json: @users.to_json
  end

  def create
    @user = User.new user_params
    return (render json: @user.errors, status: 422) unless @user.save

    render json: @user.to_json, status: :created
  end

  def update
    @user.assign_attributes(user_params.reject { |_, v| v.blank? })
    return (render json: @user.errors, status: 422) unless @user.save

    render json: @user.to_json
  end

  def destroy
    return (render status: 404) unless User.exists?(id: params[:id].to_i)

    @user.destroy
    render status: 200
  end

  private

  def user?
    @user = User.exists?(id: params[:id]) ? User.find(params[:id]) : nil
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
