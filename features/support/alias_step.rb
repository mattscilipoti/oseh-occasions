#defines Step, which is the generic When/Then/Given, since they actually have no meaning to cucumber, they're just fluff for human eyes
#written by Ian White, observed by yours truly
#see: https://gist.github.com/239673

module AliasStep
  def Step(arg)
    When arg
  end
end

World(AliasStep)

class << self
  alias Step When
  alias step Step
end
