class CargoVagon < Vagon

  def place(volume)
    if free_quota >= volume
      self.used_quota += volume
    else
      puts "sorry, not enough free space"
      return false
    end
  end

  def free_volume
    free_quota
  end

  def format
    "number: #{number}/type: cargo/free: #{free_quota}/placed: #{used_quota}"
  end

  private

  def validate!
    raise "Volume must be positive number" unless @quota > 0
    true
  end
end
