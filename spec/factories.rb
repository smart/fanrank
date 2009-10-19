Factory.define :fan do |f|
  f.sequence(:first_name)     { |n| "Joe#{n}" }
  f.sequence(:last_name)      { |n| "Fan#{n}" }
  f.sequence(:email_address)  { |n| "joefan#{n}@somewhere.com" }
  f.score                     100.0
end

Factory.define :twitter_profile, :class => :profile do |tp|
  tp.association :data_source, :factory => :twitter_data_source
  tp.sequence(:identifier)    { |n| "joefan#{n}"}
end

Factory.define :twitter_data_source do |tds|
  tds.name "Thrillist Brand"
  tds.keyword "Thrillist.com"
end

Factory.define :twitter_profile_with_data, :parent => :twitter_profile do |tp|
  tp.data({
    :tweets => [{ :text => "one", :positive => true }, { :text => "two", :positive => false }],
    :followers => ["follower1", "follower2", "follower3"] 
  })
end