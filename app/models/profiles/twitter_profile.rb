class TwitterProfile < Profile
  
  named_scope :top_100, :order => 'score DESC', :limit => 100
  
  before_validation_on_create :initialize_subscores, :initialize_data
  before_save :compute_score
  after_save :update_fan
  
  validate :validate_subscores
  
  def initialize_subscores
    self.subscores ||= {}
    self.subscores = { :reach => 0.0, :mention => 0.0, :vibe => 0.0 }.merge(self.subscores)
  end
  
  def initialize_data
    self.data ||= {}
    self.data = { :tweets => [], :followers => [] }.merge(self.data)
  end
  
  def validate_subscores
    unless (self.subscores.keys - [:reach, :mention, :vibe]).empty?
      @errors.add(:subscores, "Subscores hash must only contain: reach, mention, vibe")
    end
  end
  
  def compute_score
    self.subscores = {:reach => compute_reach_score, :mention => compute_mention_score, :vibe => compute_vibe_score}
    self.score = self.subscores.values.sum
  end
  
  def update_fan
    self.fan && self.fan.save
  end
  
  private
  
  def compute_vibe_score
    return 0.0 if data[:tweets].empty?
    (data[:tweets].select {|tweet| tweet[:positive] == true }.size).to_f / data[:tweets].size.to_f
  end
  
  def compute_mention_score
    data[:tweets].size.to_f
  end
  
  def compute_reach_score
    data[:followers].size.to_f
  end

  
end
