class AttractionsController < ApplicationController
	before_action :set_attraction, only: [:show, :edit, :update, :delete]

	def index
		@attractions = Attraction.all
	end

	def new
		@attraction = Attraction.new
	end

	def create
		@attraction = Attraction.new(attraction_params)
		if @attraction.save!
			redirect_to @attraction 
		else
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @attraction.update(attraction_params)
			redirect_to @attraction
		else
			render :edit
		end	
	end

	private

	def set_attraction
		@attraction = Attraction.find(params[:id])
	end

	def attraction_params
		params.require(:attraction).permit(:name, :min_height, :tickets, :happiness_rating, :nausea_rating)  
	end
end
