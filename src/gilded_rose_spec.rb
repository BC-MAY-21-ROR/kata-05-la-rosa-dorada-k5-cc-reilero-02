require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do
  describe "#quality_sulfuras" do
    it "does not change the name" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 0, 80)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 80
    end
  end
  describe "#update_sell_in" do
    it "does not change the name" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 80)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 10
    end
  end
  describe "#update_quality_backstage_passes" do
    it "does not change the name" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 20, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 19
      expect(items[0].quality).to eq 11
    end
  end
  describe "#update_quality_backstage_passes" do
    it "does not change the name" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 20, 80)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq 'Sulfuras, Hand of Ragnaros'
      
    end
  end
  describe "#update_select_items" do
    it "does not change the name" do
      items = [Item.new("Conjured Mana Cake", 20, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq 'Conjured Mana Cake'
      expect(items[0].quality).to eq 48
      
    end
  end
  describe "#update_select_items" do
    it "does not change the name" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 20, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq 'Backstage passes to a TAFKAL80ETC concert'
      expect(items[0].quality).to eq 50
      
    end
  end
  describe "#update_select_items" do
    it "does not change the name" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq 'Backstage passes to a TAFKAL80ETC concert'
      expect(items[0].quality).to eq 0
      
    end
  end
end
