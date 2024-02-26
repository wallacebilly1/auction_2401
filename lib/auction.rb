class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map do |item|
      item.name
    end
  end

  def unpopular_items
    @items.select do |item|
      item.bids.empty?
    end
  end

  def potential_revenue
    potential_revenue = 0
    @items.each do |item|
      if item.bids.any?
        item_revenue = item.bids.values.max
        potential_revenue += item_revenue
      end
    end
    potential_revenue
  end

  def bidders
    @items.map do |item|
      item.bids.keys.map do |key|
        key.name
      end
    end.flatten.uniq
  end

  def bidder_info
    bidder_info = {}
    @items.each do |item|
      item.bids.each do |attendee, _|
        if bidder_info.key?(attendee)
          bidder_info[attendee][:items] << item
        else
          bidder_info[attendee] = {
            budget: attendee.budget,
            items: [item]
          }
        end
      end
    end
    bidder_info
  end
end