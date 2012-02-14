step "I should be on the home page" do
  current_path = URI.parse(current_url).path
  current_path.should == '/'
end

step "I visit :path" do |path|
  visit path
end

step "I visit the home page" do
  visit '/'
end

step "I should see an overview of the High Holidays" do
  texts = ['Welcome', 'High Holidays', 'Oseh Shalom']
  texts.each do |text|
    page.should have_content(text)
  end
end

