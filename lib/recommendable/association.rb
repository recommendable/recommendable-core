module Recommendable
  class Association
    attr_reader :owner, :target

    def initialize(owner, target)
      raise ArgumentError, 'Target must be a class' unless target.is_a?(Class)
      @owner, @target = owner, target
    end
  end
end
