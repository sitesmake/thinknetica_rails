class Vagon
  include Manufacturer

  @@vagons = []

  def initialize
    @@vagons << self
  end

  def self.all
    @@vagons
  end

  def type
    self.class.to_s.split('Vagon')[0].downcase.to_sym
  end
end