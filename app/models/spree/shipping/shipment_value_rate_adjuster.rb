module Spree::Shipping
  class ShipmentValueRateAdjuster < RateAdjuster
    validates :max_shipment_value, :min_shipment_value, :flat_price_adjustment, :delivery_window_days_adjustment, presence: true
    
    def adjust(rate, package)
      value = package.value
      if value && max_shipment_value && min_shipment_value && value <= max_shipment_value && value >= min_shipment_value
        rate.cost += flat_price_adjustment if rate.cost
        rate.delivery_window.start += delivery_window_days_adjustment.days if rate.delivery_window && rate.delivery_window.start
        rate.delivery_window.end += delivery_window_days_adjustment.days if rate.delivery_window && rate.delivery_window.end
      end
    end
  end
end