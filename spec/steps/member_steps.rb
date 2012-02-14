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

