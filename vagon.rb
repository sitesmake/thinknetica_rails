class Vagon
  include Manufacturer
  include InstanceCounter

  @@vagons = []

  def initialize
    @@vagons << self
    # register_instance
    @@instances << self
  end

  def self.all
    @@vagons
  end

  def type
    self.class.to_s.split('Vagon')[0].downcase.to_sym
  end
end