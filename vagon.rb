class Vagon
  include Manufacturer
  include InstanceCounter

  @@vagons = []

  attr_accessor :number
  attr_reader :quota
  attr_reader :used_quota

  def initialize(quota=50)
    @quota = quota.to_i
    @used_quota = 0

    validate!

    @@vagons << self
    register_instance
  end

  def self.all
    @@vagons
  end

  def type
    self.class.to_s.split('Vagon')[0].downcase.to_sym
  end

  def free_quota
    quota - used_quota
  end

  protected

  attr_writer :used_quota

  def validate!
    raise validation_error_message unless @quota > 0
    true
  end

  def add(amount)
    if free_quota >= amount
      self.used_quota += amount
    else
      puts not_enough_message
      return false
    end
  end

end