require 'set'
require "narray"

class Recommend < ActiveRecord::Base
  belongs_to :user
  belongs_to :music

  def self.make_rating(current_user_id)
    #パラメータの設定
    a = 0.05
    lam = 0.1
    #データの初期化
    ratings = Rating.all
    users = {}
    items = {}
    rating = []
    #データの格納
    ratings.each do |rate|
      users["#{rate[:user_id]}"] = NVector.float(5).randomn
      items["#{rate[:music_id]}"] = NVector.float(5).randomn
      rating << [rate[:user_id],rate[:music_id],rate[:rate]]
    end
    # #モデルの学習
    # for num in 1..10 do
    #   rating.each do |user,item,rate|

    #     d = -(rate - users["#{user}"]*items["#{item}"]) + lam

    #     puts d

    #     users["#{user}"] -= a * d * users["#{user}"]
    #     items["#{item}"] -= a * d * items["#{item}"]

    #   end
    # end
    #評価値の推定と保存
    items.each do |item,iv|
      recommend = Recommend.where(user_id:current_user_id,music_id:item).first_or_initialize
      recommend[:rating] = users["#{current_user_id}"]*iv
      begin
        recommend.save
      rescue
        binding.pry
      end
    end
  end
end
