module Ilike
  class ArelTemplate
    attr_reader :field, :values

    def initialize(arr)
      @field, @values = arr
    end

    def build
      if Array === values
        values.map {|value| template(value)}
      else
        template(values)
      end
    end

    def template(value)
      "(arel_table[:#{field}].matches('#{value}'))"
    end
  end
end