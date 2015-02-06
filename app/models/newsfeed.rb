class Newsfeed < ActiveRecord::Base
  belongs_to :school
  belongs_to :admin
end
