class GildedRose

  def initialize(items)
    @items = items
  end

  def update_item_quality(item, value)
    if item.quality + value <= 50 && item.quality + value >= 0
      item.quality = item.quality + value
    end
  end

  def quality_rose(item)
    if item.sell_in < 0
      if item.name != "Aged Brie"
        if item.name != "Backstage passes to a TAFKAL80ETC concert"
          if item.quality > 0
            quality_sulfuras(item)
            if item.quality > 0 and item.name ==  "Conjured Mana Cake" 
              quality_sulfuras(item)
            end
          end
        else
          item.quality = item.quality - item.quality
        end
      else
        update_item_quality(item, 1)
      end
    end
  end

  def quality_sulfuras(item)
    if item.name != "Sulfuras, Hand of Ragnaros"
      item.quality = item.quality - 1
    end
  end

  def update_sell_in(item)
    if item.name != "Sulfuras, Hand of Ragnaros"
      item.sell_in = item.sell_in - 1
    end
  end

 

  def update_quality_backstage_passes(item)
    if item.sell_in < 11
      update_item_quality(item, 1)
    end
    if item.sell_in < 6
      update_item_quality(item, 1)
    end
  end

  def update_quality()

    @items.each do |item|
      
      next if item.name == "Sulfuras, Hand of Ragnaros"

      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert" 
        update_item_quality(item, -1)
        if item.name == "Conjured Mana Cake"
          update_item_quality(item, -1)
        end
      else
        update_item_quality(item, 1)
        if item.name == "Backstage passes to a TAFKAL80ETC concert"
          update_quality_backstage_passes(item)
        end
      end
      update_sell_in(item)
      #Quality < 50 

      quality_rose(item)
    end
    

  end
end


class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
