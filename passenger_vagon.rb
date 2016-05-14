class PassengerVagon < Vagon

  def take_seat
    if free_quota > 0
      self.used_quota += 1
    else
      puts "Sorry, no more seats"
      return false
    end
  end

  def format
    "number: #{number}/type: cargo/free: #{free_quota}/passengers: #{used_quota}"
  end

  private

  def validate!
    raise "Seats number must be positive number" unless @quota > 0
    true
  end
end
