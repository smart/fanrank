class Profile < ActiveRecord::Base
  serialize :data
  serialize :subscores
  belongs_to :fan
end
