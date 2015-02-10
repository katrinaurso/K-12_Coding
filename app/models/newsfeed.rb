class Newsfeed < ActiveRecord::Base
  belongs_to :school
  belongs_to :admin
  belongs_to :updated_by, class_name: "Admin"

  validates :title, presence: true, length: { minimum: 3, maximum: 45 }
  validates :content, presence: true, length: { minimum: 140 }
  validates :admin, :school, presence: true
end