steps_for :welcome do
  step "I should be on the home page" do
    current_path = URI.parse(current_url).path
    current_path.should == '/'
  end

  step "I should see :text" do |text|
    page.should have_content(text)
  end
end
