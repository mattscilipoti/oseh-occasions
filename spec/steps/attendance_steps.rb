step 'I indicate that :attendees will be attending' do |attendees|
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

step 'I should see that :attendee_count person/people is/are attending' do |expected_attendee_count|
  #TODO: convert to int
  step %(I should see "#{expected_attendee_count} Attendee")
end
