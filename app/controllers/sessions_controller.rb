class SessionsController < ApplicationController
	before_action :check_login, only: [:destroy]
	def new
	end

	def create
		user = User.find_by(name: params[:user][:name])
		if user && user.authenticate(params[:user][:password])
			log_in(user)
			redirect_to user
		else
			redirect_to root_path
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end
end
