module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(name, type, *args)
      @validations ||= {}
      @validations[name] ||= []
      @validations[name] << [type, *args]
    end

    attr_reader :validations
  end

  module InstanceMethods
    def validate!
      self.class.validations.each do |attr, validations|
        value = instance_variable_get("@#{attr}")

        validations.each do |valid|
          send("validate_#{valid.first}", value, valid[1..-1])
        end
      end
    end

    def valid?
      begin
        validate!
      rescue
        false
      end
    end

    protected

    def validate_presence(value, *args)
      raise "presence error" if (value.nil? || value.to_s.empty?)
    end

    def validate_format(value, *args)
      return "format error" if value !~ args
    end

    def validate_type(value, *args)
      return "type error" if value.class != args
    end
  end
end



class Car
  include Validation

  attr_accessor :number
  attr_accessor :firma

  validate :number, :type, Fixnum
  validate :number, :presence
  validate :firma, :presence
end

car = Car.new
car.number = 101
car.firma = 'bmw'

car.validate!