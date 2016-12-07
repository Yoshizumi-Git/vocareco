require 'set'
require "narray"

vnjaklbjfalbvfjkal

class Recommend < ActiveRecord::Base
  belongs_to :user
  belongs_to :music

  def self.make_rating
    #パラメータの設定
    a = 0.05
    lam = 0.5
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
    #モデルの学習
    rating.each do |user,item,rate|
      d = -(rate - users["#{user}"]*items["#{item}"]) + lam
      users["#{user}"] -= a * d * users["#{user}"]
      items["#{item}"] -= a * d * items["#{item}"]
    end
    #評価値の推定と保存
    users.each do |user,uv|
      items.each do |item,iv|
        recommend = Recommend.where(user_id:user,music_id:item).first_or_initialize
        recommend[:rating] = uv*iv
        recommend.save
      end
    end
  end
end
