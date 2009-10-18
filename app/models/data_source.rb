class DataSource < ActiveRecord::Base
  validates_presence_of :name
  
  has_many :profiles
end
