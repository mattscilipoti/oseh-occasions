step "I should be on the home page" do
  current_path = URI.parse(current_url).path
  current_path.should == '/'
end

step 'I visit "$path"' do |path|
  visit path
end

step /I visit the "([^"]+)" event page/ do |event_name|
  event = Event.find_by_name(event_name)
  visit event_path(event)
  @current_event = event
end

step "I visit the home page" do
  visit '/'
end
