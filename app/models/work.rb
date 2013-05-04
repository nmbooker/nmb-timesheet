class Work < ActiveRecord::Base
  attr_accessible :activity_id, :date, :description, :minutes, :project_id
end
