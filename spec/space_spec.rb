require './lib/space'

describe Space do

  it "can add a listing" do
    setup
    Space.add(name: "Fourth space", description: "Is nice", price: "Not too steep", date: "10/10/1900")
    expect(Space[1][:name]).to eq("Fourth space")
  end

  it "can update booked status" do
    setup
    entry = Space.first(:name => 'Third space')
    entry.book("Third space")
    expect(Space[0][:available]).to eq(false)
  end

  it "goes round your mum's house for tea" do
    head_to_your_mums_house
    Me.have_tea
    expect(Me.eaten_tea?).to eq(true)
  end

end
