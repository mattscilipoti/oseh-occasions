step 'I indicate that "$attendees" will be attending' do |attendees|
  #TODO: use turnip tranform
  #TODO: does rails have a split sentence helper?
  attendee_list = attendees.gsub('&', '').split(',')
  attendee_list.each do |name|
    person = @current_user.household.members.with_name(name).first
    check(dom_id(person, :attending))
  end
  submit_form
end

step 'I should not be asked about attendance' do
  step %{I should not see "Who will attend?"}
end

step /should see that (\d+) (?:person|people) (?:is|are) attending$/ do |expected_attendee_count|
  element_id = dom_id(@current_event, :attendee_count)
  page.find_by_id(element_id).text.should =~ /#{expected_attendee_count}/
end

step /should see that (\d+) (?:person|people) (?:is|are) attending from your household$/ do |expected_attendee_count|
  element_id = dom_id(@current_event, :household_attendee_count)
  page.find_by_id(element_id).text.should =~ /#{expected_attendee_count}/
end
