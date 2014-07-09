require 'active_support/core_ext/class/attribute'
require 'active_support/core_ext/string/inflections'
require 'active_support/concern'
require 'recommendable/core/version'

module Recommendable
  extend ActiveSupport::Concern

  included do
    class_attribute :_recommendables
    self._recommendables = {}
  end

  module ClassMethods
    def recommended(*things)
      things.each do |thing|
        _recommendables[thing.to_sym] = thing.to_s.classify.constantize
      end
    end
  end
end
