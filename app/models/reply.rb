class Reply < ActiveRecord::Base
  belongs_to :refrigerator
  belongs_to :user
end
