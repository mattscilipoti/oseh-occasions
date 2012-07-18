step "these Events:" do |table|
  table.hashes.each do |attrs|
    factory_name = :event_full
    events = attrs.delete('SubEvents')
    if !events.blank?
      attrs['event_ids'] = Event.where('name in (?)', events).pluck(:id)
      factory_name = :compound_event
    end

    new_event = Factory.create factory_name, attrs.attributize_keys
  end
end

step 'I should see these People:' do |table|
  actual = page.find('#rsvp table').all('tr').map do |row|
    row.all('th, td').map do |cell|
      # TODO is there a way to test for checkbox w/o exception?
      begin
        checkbox = cell.find('input[type=checkbox]')
        checkbox.checked? ? 'Yes' : 'No'
      rescue Capybara::ElementNotFound
        cell.text.strip
      end
    end
  end
  table.diff!(actual)
end

