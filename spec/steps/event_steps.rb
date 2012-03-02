step "these Events:" do |table|
  table.hashes.each do |attrs|
    Factory.create :event, attrs.attributize_keys
  end
end
