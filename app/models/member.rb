class Member < ActiveRecord::Base

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
