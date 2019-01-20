class Api::V1::UsersController < ApplicationController

  skip_before_action :authorized, only: [:index, :create]

    def index
        @users = User.all
        render json: @users
    end

    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
          @token = encode_token(user_id: @user.id)
          render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else
          render json: { error: 'failed to create user' }, status: :not_acceptable
        end
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
