class Fan < ActiveRecord::Base
  
  has_many :profiles
  
  named_scope :top_100, :order => 'score DESC, created_at ASC', :limit => 100
  
  before_save :compute_score
  
  def compute_score
    self.score = profiles.sum(:score)
  end
  
end
