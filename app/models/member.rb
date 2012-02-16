class Member < ActiveRecord::Base

  # TODO: save full name and full_text search it?
  scope :with_name, lambda { |partial_name|
    # TODO: use library fo like (postgres need ILIKE)
    where("first_name LIKE :partial_name OR middle_name LIKE :partial_name OR last_name LIKE :partial_name", :partial_name => "%#{partial_name}%")
  }

  def self.full_names(*args)
    options = args.extract_options!
    if options[:only_names]
      # supports twitter bootstrap typeahead function
      # TODO: if we save full_name, we can use pluck(:full_name)
      scoped.collect &:full_name
    else
      members = scoped
      if args
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
    /Mr\.|Ms\.|Mrs\.|Miss|Hon\.|Rabbi/
  end

  def full_name
    @full_name ||= [first_name, middle_name, last_name].join(' ')
  end

  def full_name=(value)
    (@full_name = value).tap do |full_name|
      parts = full_name.split(' ')
      if parts[0] =~ Member.title_pattern
        self.title = parts.shift
      end
      self.first_name  = parts[0]
      self.middle_name = parts[1]
      self.last_name   = parts[2]
      self.name_suffix      = parts[3]
    end
  end
end
