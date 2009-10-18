Given /^the following data_sources:$/ do |data_sources|
  DataSource.create!(data_sources.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) data_source$/ do |pos|
  visit data_sources_url
  within("table > tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following data_sources:$/ do |expected_data_sources_table|
  expected_data_sources_table.diff!(table_at('table').to_a)
end

When /^I fill out the form with valid information$/ do
  select("Twitter")
  fill_in("name", :with => "Thrillist Brand Tracker")
  fill_in("keyword", :with => "thrillist.com")
end

When /^I am  "([^\"]*)" page$/ do |arg1|
  @data_source = DataSource.find_by_name(arg1)
  visit data_source_url(@data_source)
end

When /^confirm that I want to delete the data source$/ do
  pending
end

Then /^not see "([^\"]*)" data source$/ do |name|
  within(".data_sources") do |overlay|
    overlay.should_not contain(name)
  end
end

Given /^I have a Twitter Data Source "([^\"]*)"$/ do |arg1|
  @data_source = TwitterDataSource.create(:name => arg1, :keyword => "thrillist.com")
end

Given /^Profiles for 10 Twitter Data Sources fans$/ do
  pending
end

Then /^I should see the top fans ordered by scores$/ do
  pending
end

When /^I rename the source "([^\"]*)"$/ do |name|
  fill_in("name", :with => name)
end

Then /^I should see recalculated top fans on the show page$/ do
  pending
end
