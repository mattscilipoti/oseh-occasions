step "I visit :path" do |path|
  visit path
end

step 'I visit the :event_name event page' do |event_name|
  event = Event.find_by_name(event_name)
  visit event_path(event)
end

step "I visit the home page" do
  visit '/'
end
