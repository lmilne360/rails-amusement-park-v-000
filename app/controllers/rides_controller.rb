class RidesController < ApplicationController
	def new
	ride = Ride.new(user_id: params[:user_id], attraction_id: params[:attraction_id])
	if ride.save
		flash.notice = ride.take_ride
    	redirect_to user_path(ride.user)
	end
  end

end
