class List < ActiveRecord::Base
  belongs_to :refrigerator
  belongs_to :user
  belongs_to :event
end
