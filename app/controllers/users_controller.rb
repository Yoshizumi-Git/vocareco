class UsersController < ApplicationController
  def show
    #Recommend.make_rating(current_user.id)
    @recommends = Recommend.find_by_sql(['select * from recommends where user_id = :id order by rating DESC limit 10', {id: current_user.id}])
  end
end
