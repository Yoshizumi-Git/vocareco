class Music < ActiveRecord::Base
  has_many :ratings
  has_many :comments
  has_many :recommends
end
