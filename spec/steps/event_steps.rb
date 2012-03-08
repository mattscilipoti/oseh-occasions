step "these Events:" do |table|
  table.hashes.each do |attrs|
    Factory.create :event, attrs.attributize_keys
  end
end

step 'I should see these People:' do |table|
  actual = page.find('table').all('tr').map { |row| row.all('th, td').map { |cell| cell.text.strip } }
  diff = table.diff(TableDiff::Table.new(actual))
  diff.should_not be_different, diff
end

