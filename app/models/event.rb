class Event < ActiveRecord::Base
  has_many :refrigerator
  has_many :lists
end
