module Validation

  def self.included(base)   -> (Car)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  class Car
    @@var = 1
  end

  class Moped < Car
    @@var = 2
  end

  class Vedro
    @@var = 3
  end


  module ClassMethods
    # def self.validate(name, type, *args)
    def validate(name, type, *args) -> поскольку он допишется extendom
      @validations -> # = { tyres: [[:presence], [:quantity, 4]], power: [[:presence]] } -> @@ сейчас это переменная класса
    end

    # validate :name, :presence

    # def self.validations

    # def validations
    #   @validations
    # end
    attr_reader :validations
  end

  module InstanceMethods
    def validate!
      class.validations.each do |attr, validations|
        value = instance_variable_get(attr) #4, nil

        validations.each do |valid|
          send("validate_#{valid.first}", value, valid[1..-1])
        end

      end
    end

    private

    def validate_presence(value, *args)
      raise "" if value.nil?
    end

    def validate_quantity(value, *args)
      raise "" if value != args.first
    end
  end
end





class Car

  include Validation -> отрабатывает интерпретатор, и запускает self.included(base)... base->Car

  # extend Validation::ClassMethods -> extend грубо говоря копирует, но добавляет self.
  # include Validation::InstanceMethods -> грубо говоря скопировались

  @@firms = ['bmw', 'audi']

  def self.firms
    @@firms   -> это становится и сеттером
  end



  ...

  self.validate(name, type, *args)
    ...

  end


  validate :tyres, :presence
  validate :tyres, :quantity, 4
end

car1 = Car.new
car2 = Car.new
car1.tyres = 4

car1.validate! -> true | error