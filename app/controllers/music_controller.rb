class MusicController < ApplicationController
  def index
    @music = Music.offset( rand(Music.count) ).first
  end

  def new
  end

  def create
    like={"大好き" => 2,"好き" => 1,"知らない" => 0,"嫌い" => -1,"大嫌い" => -2}
    print(params)
    rating = Rating.where(music_id:params[:music_id],user_id:current_user.id).first_or_initialize
    rating[:rate] = like[params[:rating]]
    rating.save

    @music = Music.offset( rand(Music.count) ).first
    # redirect_to action: :index
  end
end
