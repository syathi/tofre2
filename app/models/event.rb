class Event < ActiveRecord::Base
  has_many :refrigerators
  has_many :lists
end
