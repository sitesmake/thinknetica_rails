class PassengerTrain < Train
	public_class_method :new

  def initialize(title, vagons)
    super(title, :passenger, vagons)
  end
end
