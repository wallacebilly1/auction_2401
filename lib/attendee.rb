class Attendee
  attr_reader :name

  def initialize(att_info)
    @name = att_info[:name]
  end

end