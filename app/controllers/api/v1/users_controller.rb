class Api::V1::UsersController < ApplicationController
    def index 
        render json: { users: UserSerializer.new(User.all) }
    end 

    def create 
        @user = User.create(user_params)
        if @user.valid?
            render json: { user: UserSerializer.new(@user) }, status: :created 
        else 
            render json: { errors: @user.errors.full_messages }, status: :not_acceptable
        end 
    end 

    private 

    def user_params 
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end 
end
