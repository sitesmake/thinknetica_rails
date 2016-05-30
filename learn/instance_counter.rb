module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :instances

    def instances
      @instances ||= 0
    end
  end

  module InstanceMethods
    protected

    def register_instance
      self.class.instances += 1
    end
  end
end




class Car
  self -> Car

  def self.power -> пропуск по алгоритму, имеет доступ только к @@
  end

  def power
    self.power1 = 1
  end

  def djfhskjhdfkh
  end
end

car = Car.new -> car

car.power1 = 1
car.power = 1

Car.power