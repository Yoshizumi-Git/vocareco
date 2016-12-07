class MusicController < ApplicationController
  def index
  end

  def new
  end

  def create
    if params[:music_id].present?
      params[:music_id].each do |music_rate|
        rating = Rating.where(music_id:music_rate[0],user_id:current_user.id).first_or_initialize
        rating[:rate] = music_rate[1]
        rating.save
      end
    end
    redirect_to action: :index
  end
end
