class CargoVagon < Vagon
  attr_reader :volume
  attr_reader :placed

  def initialize(volume=1000)
    @volume = volume.to_i
    @placed = 0

    validate!

    super
  end

  def place(volume)
    if free_volume >= volume
      self.placed += volume
    else
      puts "sorry, not enough free volume"
      return false
    end
  end

  def free_volume
    volume - placed
  end

  private

  attr_writer :placed

  def validate!
    raise "Volume must be positive number" unless @volume > 0
    true
  end
end
