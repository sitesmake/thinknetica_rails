module FuelTank
  def fill_tank(level)
    self.fuel_tank = level
  end

  def fuel_level
    fuel_tank
  end

  protected

  attr_accessor :fuel_tank
end

module Debugger
  def debug(txt)
    puts "!!!DEBUG: #{txt} !!!"
  end
end

class Car
  include FuelTank
  extend Debugger

  def initialize
    self.class.debug 'initialized'
  end

  def show_protected
    puts '1'
    puts fuel_tank
    puts '2'
    puts fuel_tank
  end
end

class MotorBike
  include FuelTank
  extend Debugger
end
