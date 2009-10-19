class TwitterDataSource < DataSource
  validates_presence_of :keyword
  
  def self.subscores
    [:reach, :mention, :vibe]
  end
  
  def self.data_fields
    {:tweets => [], :followers => []}
  end
  
  def compute_scores(data)
    {:reach => compute_reach_score(data), :mention => compute_mention_score(data), :vibe => compute_vibe_score(data)}
  end
  
  private
  
  def compute_vibe_score(data)
    return 0.0 if data[:tweets].empty?
    (data[:tweets].select {|tweet| tweet[:positive] == true }.size).to_f / data[:tweets].size.to_f
  end
  
  def compute_mention_score(data)
    data[:tweets].size.to_f
  end
  
  def compute_reach_score(data)
    data[:followers].size.to_f
  end
  
end
