class CargoVagon < Vagon
  def not_enough_message
    'Sorry, not enough free space'
  end

  def validation_error_message
    'Volume must be positive number'
  end

  def place(amount)
    add(amount)
  end

  def format
    "number: #{number}/type: cargo/free: #{free_quota}/placed: #{used_quota}"
  end
end
