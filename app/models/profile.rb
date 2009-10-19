class Profile < ActiveRecord::Base
  include TokenGenerator

  serialize :data
  serialize :subscores
  belongs_to :fan
  belongs_to :data_source, :class_name => "DataSource", :foreign_key => "data_source_id"

  before_create :set_token
  before_validation_on_create :initialize_subscores, :initialize_data
  validate :validate_subscores
  after_save :update_fan
  before_save :compute_score
  
  named_scope :top_100, :order => 'score DESC', :limit => 100
  
  def initialize_subscores
    self.subscores ||= {}
    self.subscores = base_subscores.merge(self.subscores)
  end
  
  def base_subscores
    base_hash = {}
    data_source.try(:subscores).each {|sub| base_hash[sub] = 0.0}
    base_hash
  end
  
  def initialize_data
    self.data ||= {}
    self.data = data_source.try(:data_fields).merge(self.data)
  end
  
  def validate_subscores
    unless (self.subscores.keys - data_source.subscores).empty?
      @errors.add(:subscores, "Subscores hash must only contain: #{data_source.subscores}")
    end
  end
  
  def compute_score
    self.subscores = data_source.compute_scores(data)
    self.score = self.subscores.values.sum
  end
  
  private
  
  def update_fan
    self.fan && self.fan.save
  end
  
end
