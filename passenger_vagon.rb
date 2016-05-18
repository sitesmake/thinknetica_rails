class PassengerVagon < Vagon
  def not_enough_message
    'Sorry, no more seats'
  end

  def validation_error_message
    'Seats number must be positive number'
  end

  def take_seat
    add(1)
  end

  def format
    "number: #{number}/type: cargo/free: #{free_quota}/passengers: #{used_quota}"
  end
end
