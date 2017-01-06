class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
	before_action :check_login, only: [:show, :update]


	def index
		@user = User.all
	end

	def show	
	end

	def new
		@user = User.new
	end

	def create
		user = User.new(user_params)
		if user.save!
			log_in(user)
			redirect_to user 
		else
			render :new
		end
	end

	def edit	
	end

	def update
		if @user.update(user_params)
			redirect_to @user 
		else
			render :edit
		end
	end

	def destroy
		@user.destroy
	end

	private

	def user_params
		params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
	end

	def set_user
		@user = User.find_by_id(params[:id])
	end
end
