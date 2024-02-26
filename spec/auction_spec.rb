require 'pry'
require 'rspec'
require './lib/auction'
require './lib/item'
require './lib/attendee'

describe Auction do
  before :each do
    @auction = Auction.new
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')
    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
  end

  it 'exists' do
    expect(@auction).to be_an Auction
  end

  it 'can add items to an array' do
    expect(@auction.items).to eq []

    @auction.add_item(@item1)
    @auction.add_item(@item2)

    expect(@auction.items).to eq [@item1, @item2]
  end

  it 'can return the names of the items in the auctions array' do
    @auction.add_item(@item1)
    @auction.add_item(@item2)

    expect(@auction.item_names). to eq ["Chalkware Piggy Bank", "Bamboo Picture Frame"]
  end

  it 'can return any unpopular items in the auction' do
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)
    
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    @item4.add_bid(@attendee3, 50)

    expect(@auction.unpopular_items).to eq [@item2, @item3, @item5]

    @item3.add_bid(@attendee2, 15)

    expect(@auction.unpopular_items).to eq [@item2, @item5]
  end

  it 'returns the sum of the current high bids as the potential revenue' do
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)
    
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    @item4.add_bid(@attendee3, 50)
    @item3.add_bid(@attendee2, 15)

    expect(@auction.potential_revenue). to eq 87
  end

  it 'returns the names of all bidders' do
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)
    
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    @item4.add_bid(@attendee3, 50)
    @item3.add_bid(@attendee2, 15)

    expect(@auction.bidders).to eq ["Bob", "Megan", "Mike"]
  end

  it 'returns all bidder info' do
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)
    
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    @item4.add_bid(@attendee3, 50)
    @item3.add_bid(@attendee2, 15)

    expect(@auction.bidder_info.keys).to eq [@attendee2, @attendee1, @attendee3]

    expect(@auction.bidder_info[@attendee2]).to eq ({:budget => 75, :items => [@item1, @item3]})
    expect(@auction.bidder_info[@attendee1]).to eq ({:budget => 50, :items => [@item1]})
  end

end