class Attendee
  attr_reader :name, :budget

  def initialize(att_info)
    @name = att_info[:name]
    @budget = att_info[:budget].gsub(/^\$/, '').to_i
  end

end