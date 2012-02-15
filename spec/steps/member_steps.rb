step 'a bunch of other Members exist' do
  200.times do |n|
    Factory :member, :main_email => "#{"%03d" % n}@example.com"
  end
end

step 'I am the Member:' do |table|
  (@member = Factory.create(:member, table.rows_hash)).tap do |member|
    Rails.logger.debug("Created member: #{member.inspect}")
  end
end

step "I search for my name" do
  within '#member_search' do
    fill_in('member_query', :with => @member.full_name)
    click_link_or_button 'Search'
  end
end

step "I should see that my information is filled in automatically" do
  within '#member_information' do
    page.should have_field('#main_phone', :with => @member.main_phone)
  end
end

