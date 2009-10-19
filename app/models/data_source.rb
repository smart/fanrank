class DataSource < ActiveRecord::Base
  validates_presence_of :name
  
  has_many :profiles
  
  def self.subscores
    []
  end
  
  def self.data_fields
    []
  end
  
  def subscores
    self.class.subscores
  end
  
  def data_fields
    self.class.data_fields
  end
  
  def compute_scores
    raise "Do this in your subclasses"
  end
  
end
