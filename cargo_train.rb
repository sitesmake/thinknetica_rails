class CargoTrain < Train
	public_class_method :new

  def initialize(title, vagons)
    super(title, :cargo, vagons)
  end
end
