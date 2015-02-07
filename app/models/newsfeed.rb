class Newsfeed < ActiveRecord::Base
  belongs_to :school
  belongs_to :admin
  belongs_to :updated_by, class_name: "Admin"

  validates :title, :content, :admin, :school, presence: true
end