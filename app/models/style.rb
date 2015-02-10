class Style < ActiveRecord::Base
  belongs_to :school

  #did not throw on a validation with presence of true, so that students are able to view what it looks like raw
end
