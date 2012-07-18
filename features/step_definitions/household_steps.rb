require File.expand_path('../support/table_diff', File.dirname(__FILE__))

step "these Households:" do |table|
  table.hashes.each do |household_attributes|
    attrs = household_attributes.attributize_keys
    family_name = attrs[:family_name]
    # TODO: duplication
    head_names = household_attributes.delete(:heads_of_household).try(:split, ', ')
    heads = head_names.collect { |name|
      family_name_is_simple = (family_name =~ /[\/-]/).blank?
      name_does_not_have_last_name = !name.include?(' ')
      full_name = name_does_not_have_last_name && family_name_is_simple ? "#{name} #{family_name}" : name
      Person.find_or_create_by_full_name(:full_name => full_name, :head_of_household => true)
    }
    dependent_names = household_attributes.delete(:dependents).split(',')
    dependents = dependent_names.collect { |name|
      family_name_is_simple = (family_name =~ /[\/-]/).blank?
      name_does_not_have_last_name = !name.include?(' ')
      full_name = name_does_not_have_last_name && family_name_is_simple ? "#{name} #{family_name}" : name

      Person.find_or_create_by_full_name(full_name, :head_of_household => false)
    }
    attrs[:members] = heads | dependents
    Factory.create :household, attrs
  end
end

step "these Households should exist:" do |table|
  actual = Household.all.inject([]) do |collection, household|
    collection << table.headers if collection.blank?
    collection << [household.family_name, household.names_of_heads_of_household(', '), household.names_of_dependents(', '), household.main_phone]
  end

  diff = table.diff(TableDiff::Table.new(actual))
  diff.should_not be_different, diff

end

step "these People should have these Households:" do |table|
  actual = table.hashes.collect do |row|
    person_name = row.attributize_keys[:person]

    person    = Person.find_by_full_name(person_name)
    household = person.household
    [person.full_name, household.head?(person) ? 'Yes' : 'No', household.member_names]
    
  end
  diff = table.diff(TableDiff::Table.new(actual))
  diff.should_not be_different, diff

end
