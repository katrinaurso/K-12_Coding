class School < ActiveRecord::Base
	has_many :admins
	has_many :newsfeeds
end
