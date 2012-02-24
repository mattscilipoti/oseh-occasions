steps_for :form do
  def submit_form
    page.find("input[type='submit']").click
  end
end

steps_for :page do
  step "I should see this notice :notice" do |notice|
    page.should have_css('.flash.notice', notice)
  end
end

steps_for :person do
  use_steps :form, :page

  step 'a bunch of other People exist' do
    200.times do |n|
      Factory :person, :main_email => "#{"%03d" % n}@example.com"
    end
  end

  step "I am :full_name" do |full_name|
    person = Person.find_by_full_name(full_name)
    # TODO: login
    # login(person.id)
    visit new_session_path
    within '#person_search' do
      fill_in 'person_full_name', :with => full_name
      submit_form
    end
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
      submit_form
    end
  end

  step "I should see that my information is filled in automatically" do
    within '#person_information' do
      page.should have_selector('#main_phone', :text => @person.main_phone)
    end
  end
end

