class PassengerVagon < Vagon
  attr_reader :seats
  attr_reader :passengers

  def initialize(seats=36)
    @seats = seats.to_i
    @passengers = 0

    validate!

    super
  end

  def take_seat
    if self.passengers < self.seats
      self.passengers += 1
    else
      puts "Sorry, no more seats"
      return false
    end
  end

  def free_seats
    self.seats - self.passengers
  end

  private

  attr_writer :passengers

  def validate!
    raise "Seats number must be positive number" unless @seats > 0
    true
  end
end
