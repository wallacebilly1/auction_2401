class Item
  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = {}
    @open = true
  end

  def add_bid(attendee, price)
    if @open
      @bids[attendee] = price
    end
  end

  def current_high_bid
    @bids.values.max
  end

  def close_bidding
    @open = false
  end
end