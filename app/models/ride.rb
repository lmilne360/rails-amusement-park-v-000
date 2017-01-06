class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction


  def take_ride
  	if user.height < attraction.min_height && user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif user.height < attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets < attraction.tickets && user.height >= attraction.min_height
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    else
     user_update
     "Thanks for riding the #{attraction.name}!" 
    end 
  end

  def user_update
    user.tickets -= attraction.tickets
    user.nausea += attraction.nausea_rating
    user.happiness += attraction.happiness_rating
    user.save
  end

end
