# frozen_string_literal: true

# Method GildedRose, we can selected with the rules items
class GildedRose
  def initialize(items)
    @items = items
  end

  def quality_rose(item)
    return unless item.sell_in.negative?

    if item.name != 'Aged Brie'
      quality_select_rose(item)
    else
      update_item_quality(item, 1)
    end
  end

  def quality_select_rose(item)
    if item.name != 'Backstage passes to a TAFKAL80ETC concert'

      update_item_quality(item, -1)

      update_item_quality(item, -1) if item.name == 'Conjured Mana Cake'
    else
      item.quality -= item.quality
    end
  end

  def update_item_quality(item, value)
    item.quality = item.quality + value if item.quality + value <= 50 && item.quality + value >= 0
  end

  def quality_sulfuras(item)
    item.quality = item.quality - 1 if item.name != 'Sulfuras, Hand of Ragnaros'
  end

  def update_sell_in(item)
    item.sell_in = item.sell_in - 1 if item.name != 'Sulfuras, Hand of Ragnaros'
  end

  def update_quality_backstage_passes(item)
    update_item_quality(item, 1) if item.sell_in < 11
    update_item_quality(item, 1) if item.sell_in < 6
  end

  def update_select_items(item)
    if item.name != 'Aged Brie' && item.name != 'Backstage passes to a TAFKAL80ETC concert'
      update_item_quality(item, -1)
      update_item_quality(item, -1) if item.name == 'Conjured Mana Cake'
    else
      update_item_quality(item, 1)
      update_quality_backstage_passes(item) if item.name == 'Backstage passes to a TAFKAL80ETC concert'
    end
  end

  def update_quality
    @items.each do |item|
      next if item.name == 'Sulfuras, Hand of Ragnaros'

      update_select_items(item)
      update_sell_in(item)
      quality_rose(item)
    end
  end
end

# Name class Item and values
class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
