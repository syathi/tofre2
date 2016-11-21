class Refrigerator < ActiveRecord::Base
  belongs_to :user
  has_many :replies
  has_many :lists
  belongs_to :event
end
