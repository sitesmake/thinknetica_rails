module InstanceCounter
  # @@instances = []

  def self.included(base)
    base.class_eval do
      class_variable_set('@@instances', [])
    end

    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def instances
      @@instances.size
    end
  end

  module InstanceMethods
    protected

    def register_instance
      @@instances << self
    end
  end
end