class Person < ActiveRecord::Base
  before_save :assemble_full_name
  belongs_to :household, :inverse_of => :members

  scope :dependent, where(:head_of_household => false)
  scope :head_of_household, where(:head_of_household => true)
  # Breaks partial_name (argument) into its parts
  #   and checks to see if either part is in the full_name
  scope :with_name, lambda { |partial_name|
    return Person.scoped unless partial_name

    # TODO: can we use ideas in http://stackoverflow.com/questions/2992393/arel-how-to-cleanly-join-multiple-conditions-with-or?
    #scope = Article
    # set.each{|v| scope = scope.or(v.to_condition)}
    people = Person.arel_table
    where_clause = nil
    conditions = partial_name.split(' ').each do |name_part|
      if where_clause
        where_clause = where_clause.or(people[:full_name].matches("%#{name_part}%"))
      else #first pass
        where_clause = people[:full_name].matches("%#{name_part}%")
      end
    end
    Person.where(where_clause).order(:full_name)
  }

  def self.full_names(filter = nil)
    with_name(filter).pluck :full_name
  end

  def self.title_pattern
    #from: http://en.wikipedia.org/wiki/Title#Formal_social_titles
    /Mr\.|Ms\.|Mrs\.|Miss|Gen|Hon|Rabbi/
  end

  def full_name
    super || assemble_full_name
  end

  def full_name=(value)
    super.tap do |full_name|
      parts = full_name.split(' ')
      if parts[0] =~ Person.title_pattern
        self.title = parts.shift
      end
      self.first_name  = parts[0]
      self.middle_name = parts[1]
      self.last_name   = parts[2]
      self.name_suffix = parts[3]
    end
  end

  def household_members
    household ? household.members - [self] : []
  end

  private

  def assemble_full_name
    self.full_name = [title, first_name, middle_name, last_name, name_suffix].compact.join(' ')
  end
end



# == Schema Information
#
# Table name: people
#
#  id                :integer         not null, primary key
#  title             :string(255)
#  first_name        :string(255)
#  middle_name       :string(255)
#  last_name         :string(255)
#  name_suffix       :string(255)
#  main_phone        :string(255)
#  main_email        :string(255)
#  created_at        :datetime        not null
#  updated_at        :datetime        not null
#  full_name         :string(255)
#  household_id      :integer
#  head_of_household :boolean
#

