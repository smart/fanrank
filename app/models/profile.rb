class Profile < ActiveRecord::Base
  include TokenGenerator

  serialize :data
  serialize :subscores
  belongs_to :fan
  belongs_to :data_source, :class_name => "DataSource", :foreign_key => "data_source_id"

  before_create :set_token

end
