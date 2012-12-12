require 'ilike/version'
require 'active_record'

module Ilike
  def ilike(conditions)
    code = conditions.inject [] do |parts, arr|
      parts << ilike_template(arr)
    end.flatten.join('.and')
    class_eval "where(#{code})"
  end

  def ilike_template(arr)
    template = lambda {|field, value| "(arel_table[:#{field}].matches('#{value}'))"}
    field, values = arr
    if Array === values
      values.map {|value| template.call(field, value)}
    else
      template.call(field, values)
    end
  end
end

ActiveRecord::Base.extend Ilike
