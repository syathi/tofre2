class Event < ActiveRecord::Base
	#sをつけよう
	has_many :refrigerators
	has_many :lists
end
