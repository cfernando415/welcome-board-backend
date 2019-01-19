class Api::V1::UsersController < ApplicationController
    def index
        @users = User.all
        render json: @users
    end

    def create
        byebug
        @user = User.create(user_params)
        render json: @user, status: :accepted
    end

    def update
        @user = User.find(params[:id])
        @user.update(full_name: params[:full_name], password: params[:password], mod_id: params[:mod_id])
        render json: @user
        # if @user.save
        #     render json: @user, status: :accepted
        # else
        #     render json: {errors: @user.errors.full_messages }, status: :unprocessible_entity
        # end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        render json: { message: "removed" }, status: :ok
    end

    private
    def user_params
        params.require(:user).permits(:full_name, :password, :mod_id)
    end

    def find_user
        @user = User.find(params[:id])
    end
end
