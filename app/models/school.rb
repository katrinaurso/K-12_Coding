class School < ActiveRecord::Base
	has_many :admins
	has_many :newsfeeds
	has_one :style
end
