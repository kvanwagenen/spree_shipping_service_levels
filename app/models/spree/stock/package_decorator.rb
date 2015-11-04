Spree::Stock::Package.class_eval do
  def value
    contents.inject(0){|sum, content_item| sum + content_item.inventory_unit.variant.price}
  end
end