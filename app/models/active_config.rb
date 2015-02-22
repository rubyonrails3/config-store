class ActiveConfig < ActiveRecord::Base
  TYPE = %w(String Integer Boolean Float)
  self.inheritance_column = nil


  def self.[](key)
    Rails.cache.fetch("#{Rails.env}/#{key}") do
      find_by(key: key).try(:value)
    end
  end

  def value
    case type
    when 'Boolean'
      boolean(read_attribute(:value))
    when 'Integer'
      read_attribute(:value).to_i
    when 'Float'
      read_attribute(:value).to_f
    else
      super
    end
  end


  def boolean value
    value.to_s.downcase.in?(['true', '1', 't', 'y', 'yes']) ? true : false
  end

end
