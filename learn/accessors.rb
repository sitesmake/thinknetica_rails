module Accessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      var_history_name = "@#{name}_history".to_sym

      define_method(name) do
        instance_variable_get(var_name)
      end

      define_method("#{name}=".to_sym) { |value|
        history_value = (instance_variable_get(var_history_name) || []).push(value)
        instance_variable_set(var_history_name, history_value)
        instance_variable_set(var_name, value)
      }

      define_method("#{name}_history".to_sym) do
        instance_variable_get(var_history_name)
      end
    end
  end

  def strong_attr_accessor(name, klass)
    var_name = "@#{name}".to_sym

    define_method(name) do
      instance_variable_get(var_name)
    end

    define_method("#{name}=".to_sym) { |value|
      if value.class == klass
        instance_variable_set(var_name, value)
      else
        raise "Class of #{value} (#{value.class}) doesn't match #{klass}"
      end
    }
  end
end

class Test
  extend Accessors

  attr_accessor_with_history :hello_meta
  strong_attr_accessor :hello_strong, String
end