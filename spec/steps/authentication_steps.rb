steps_for :global do
  def login_as(person)
    # TODO: login
    #login(person)
    visit new_session_path
    within '#person_search' do
      fill_in 'person_full_name', :with => person.full_name
      submit_form
    end
    step %(I should see this notice "Shalom")
    Rails.logger.debug("Logged in as #{person.full_name}")
  end

  step 'I login successfully' do
    login_as Person.first
    visit '/'
  end

  step 'I should be on the login page' do
    current_path = URI.parse(current_url).path
    current_path.should == new_session_path
  end
end
