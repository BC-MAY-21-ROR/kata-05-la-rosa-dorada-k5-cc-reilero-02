require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do

  # describe "#update_quality" do
  #   it "does not change the name" do
  #     items = [Item.new("foo", 0, 0)]
  #     GildedRose.new(items).update_quality()
  #     expect(items[0].name).to eq "fixme"
  #   end
  # end
  describe "#quality_sulfuras" do
  it "does not change the name" do
    items = [Item.new("Sulfuras, Hand of Ragnaros", 0, 80)]
    GildedRose.new(items).update_quality()
    expect(items[0].quality).to eq 80
  end
  # def quality_sulfuras(item)
  #   item.quality = item.quality - 1 if item.name != 'Sulfuras, Hand of Ragnaros'
  # end

end

end
