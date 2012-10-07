require 'ilike/version'
require 'active_record'

module Ilike
  def ilike(condition)
    field = condition.keys.first
    value = condition.values.first
    where(arel_table[field].matches(value))
  end
end

ActiveRecord::Base.extend Ilike
