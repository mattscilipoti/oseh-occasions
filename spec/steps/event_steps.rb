step "these Events:" do |table|
  table.hashes.each do |attrs|
    sub_events = attrs.delete('SubEvents')
    attrs['sub_event_ids'] = Event.where('name in (?)', sub_events).pluck(:id) unless sub_events.nil?
    Factory.create :event_full, attrs.attributize_keys
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
  diff = table.diff(TableDiff::Table.new(actual))
  diff.should_not be_different, diff
end

