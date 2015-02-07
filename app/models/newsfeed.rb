class Newsfeed < ActiveRecord::Base
  belongs_to :school
  belongs_to :admin

  validates :content, :admin, :school, presence: true
end
