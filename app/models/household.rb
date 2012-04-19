class Household < ActiveRecord::Base
  before_save :assign_family_name
  has_many :members, :class_name => Person.name do #, :inverse_of => :household
    def attending_event(event)
      joins(:events).where('events_people.person_id in (?)', proxy_association.owner.member_ids)
    end
  end

  def family_name
    read_attribute(:family_name) || assign_family_name
  end

  def head?(person)
    person.head_of_household?
  end

  def member_names
    members.collect &:full_name
  end

  def names_of_dependents(as_string = ', ')
    names = members.dependent.collect &:full_name
    as_string ? names.join(as_string) : names
  end

  def names_of_heads_of_household(as_string = ', ')
    names = members.head_of_household.collect &:full_name
    as_string ? names.join(as_string) : names
  end

  private

  def assign_family_name
    return if read_attribute(:family_name) # self.family_name causes cycle
    last_names = members.collect{|person| person.last_name.include?('-') ? person.last_name.split('-') : person.last_name }
    write_attribute(:family_name, last_names.uniq.sort.join('/'))
  end
end

# == Schema Information
#
# Table name: households
#
#  id          :integer         not null, primary key
#  family_name :string(255)
#  main_phone  :string(255)
#

