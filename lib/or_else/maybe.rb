require 'or_else/just'
require 'or_else/nothing_class'

def Maybe(val)
  return Nothing if val.nil?
  return val if val.is_a?(OrElse::Maybe)
  OrElse::Just.new(val)
end

class Object
  def maybe
    Maybe(self)
  end
end

module OrElse
  class Maybe
    def self.sequence(array)
      Maybe(array.map { |val| val.or_else { return Nothing } })
    end
  end
end
