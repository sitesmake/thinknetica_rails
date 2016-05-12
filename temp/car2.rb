class Car
  attr_reader :current_rpm

  def initialize
    @current_rpm = 0
  end

  def start_engine
    start_engine! if engine_stopped?
  end

  def engine_stopped?
    current_rpm.zero?
  end

  private

  attr_writer :current_rpm

  INITIAL_RPM = 700

  def start_engine!
    self.current_rpm = INITIAL_RPM
  end
end
