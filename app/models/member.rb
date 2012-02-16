class Member < ActiveRecord::Base
  before_save :assemble_full_name

  # Breaks partial_name (argument) into its parts
  #   and checks to see if either part is in the full_name
  scope :with_name, lambda { |partial_name|
    # TODO: scope?

    # TODO: can we use ideas in http://stackoverflow.com/questions/2992393/arel-how-to-cleanly-join-multiple-conditions-with-or?
    #scope = Article
    # set.each{|v| scope = scope.or(v.to_condition)}
    members = Member.arel_table
    where_clause = nil
    conditions = partial_name.split(' ').each do |name_part|
      if where_clause
        where_clause = where_clause.or(members[:full_name].matches("%#{name_part}%"))
      else #first pass
        where_clause = members[:full_name].matches("%#{name_part}%")
      end
    end
    Member.where(where_clause).order(:full_name)
  }

  def self.full_names(*args)
    options = args.extract_options!
    if options[:only_names]
      # supports twitter bootstrap typeahead function
      # TODO: if we save full_name, we can use pluck(:full_name)
      scoped.collect &:full_name
    else
      members = scoped
      if args and args.is_a?(String) #ignore true (:full_names => true)
        members = members.with_name(*args)
      end
      members.collect {|member| {
        :id => member.id,
        :label => member.full_name,
        :value => member.full_name}
      }
    end
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
      if parts[0] =~ Member.title_pattern
        self.title = parts.shift
      end
      self.first_name  = parts[0]
      self.middle_name = parts[1]
      self.last_name   = parts[2]
      self.name_suffix = parts[3]
    end
  end

  private

  def assemble_full_name
    self.full_name = [title, first_name, middle_name, last_name, name_suffix].compact.join(' ')
  end
end
