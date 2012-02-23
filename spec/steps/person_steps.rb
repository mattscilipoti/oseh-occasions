step 'a bunch of other People exist' do
  200.times do |n|
    Factory :person, :main_email => "#{"%03d" % n}@example.com"
  end
end

step "I am :person" do |full_name|
  person = Person.find_by_full_name(full_name)
  visit create_session_path(:person_id => person.id)
  step %(I should see this notice "Logged In")
  Rails.logger.debug("Logged in as #{person.full_name}")
end

step 'I am the Person:' do |table|
  (@person = Factory.create(:person, table.rows_hash)).tap do |person|
    Rails.logger.debug("Created person: #{person.inspect}")
  end
end

step "I search by my :last_name" do |name_part|
  within '#person_search' do
    fill_in 'person_full_name', :with => @person.send(name_part.parameterize.underscore)
    # TODO: extract method
    page.find("input[type='submit']").click
  end
end

step "I should see that my information is filled in automatically" do
  within '#person_information' do
    page.should have_selector('#main_phone', :text => @person.main_phone)
  end
end


