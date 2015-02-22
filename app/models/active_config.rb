class ActiveConfig < ActiveRecord::Base
  TYPE = %w(String Integer Boolean Float)
  self.inheritance_column = nil


  class << self

    def [](key)
      Rails.cache.fetch("#{Rails.env}/#{key}") do
        find_by(key: key).try(:value)
      end
    end

    def []=(key, value)
      params = { key: key, value: value, type: find_type_from(value) }
      config = find_by(key: key)
      config.nil? ? create!(params) : config.update!(params)
      Rails.cache.write("#{Rails.env}/#{key}", value)
      value
    end

    def find_type_from value
      case value
      when Fixnum
        'Integer'
      when TrueClass, FalseClass
        'Boolean'
      when Float
        'Float'
      when String
        'String'
      end
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
