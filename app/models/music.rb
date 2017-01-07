class Music < ActiveRecord::Base
  self.primary_key = "id"
  has_many :ratings
  has_many :comments
  has_many :recommends
end
