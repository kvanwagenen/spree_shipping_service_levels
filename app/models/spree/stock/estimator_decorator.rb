Spree::Stock::Estimator.class_eval do

  private

  def calculate_shipping_rates(package, ui_filter)
    rates = shipping_rates_builder(package).shipping_rates
    choose_default_shipping_rate(rates)
    rates
  end

  def shipping_rates_builder(package)
    Spree::Shipping::RatesBuilder.new(package)
  end

end