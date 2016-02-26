Spree::StockLocation.class_eval do
  has_many :shipping_service_level_offerings
  has_many :shipping_service_levels, through: :shipping_service_level_offerings
  has_many :shipping_method_offerings
  has_many :shipping_methods, through: :shipping_method_offerings
  has_many :shipping_rate_adjusters, inverse_of: :stock_location, class_name: "Spree::Shipping::RateAdjuster"
  
  accepts_nested_attributes_for :shipping_service_levels

  def processing_blackout
    @processing_blackout ||= Spree::Shipping::Blackout.from_strings(processing_blackout_days, processing_blackout_dates)
  end
end