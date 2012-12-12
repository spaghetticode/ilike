require 'ilike/version'
require 'active_record'

module Ilike
  autoload :ArelTemplate, 'ilike/arel_template'

  def ilike(conditions)
    code = conditions.inject [] do |parts, arr|
      parts << ArelTemplate.new(arr).build
    end.flatten.join('.and')
    class_eval "where(#{code})"
  end
end

ActiveRecord::Base.extend Ilike
