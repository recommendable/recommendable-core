require 'active_support/core_ext/class/attribute'
require 'active_support/core_ext/string/inflections'
require 'active_support/concern'

require 'recommendable/association'
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
        klass = thing.to_s.classify.constantize
        _recommendables[thing.to_sym] = Association.new(self, klass)
      end
    end

    def reflect_on_recommendable(thing)
      _recommendables[thing.to_sym]
    end
  end
end
