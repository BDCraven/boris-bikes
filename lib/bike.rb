class Bike
  # attr_reader :broken
  
  def report_broken
    @broken = true
  end

  def broken?
    @broken
  end

  def working?
    true
  end
end
