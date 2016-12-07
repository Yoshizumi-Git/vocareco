class Music < ActiveRecord::Base
  has_many :ratings
  has_many :recommends
end
