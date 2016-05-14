class Vagon
  include Manufacturer
  include InstanceCounter

  @@vagons = []

  attr_accessor :number

  def initialize(blank)
    @@vagons << self
    register_instance
  end

  def self.all
    @@vagons
  end

  def type
    self.class.to_s.split('Vagon')[0].downcase.to_sym
  end

  def format
    case type
    when :cargo
      puts "number: #{number}/type: cargo/free: #{free_volume}/placed: #{placed}"
    when :passenger
      puts "number: #{number}/type: cargo/free: #{free_seats}/passengers: #{passengers}"
    end
  end

end