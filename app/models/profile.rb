class Profile < ActiveRecord::Base
  include TokenGenerator

  serialize :data
  serialize :subscores
  belongs_to :fan

  before_create :set_token

end
