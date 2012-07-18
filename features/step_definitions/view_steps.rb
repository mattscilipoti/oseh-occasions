def submit_form
  page.find("input[type='submit']").click
end

step 'I should see "$content"' do |content|
  page.should have_content(content)
end

step 'I should not see "$content"' do |content|
  page.should_not have_content(content)
end
