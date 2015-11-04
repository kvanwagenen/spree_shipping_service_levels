module Spree::Shipping
  class RateAdjuster < ActiveRecord::Base
    belongs_to :stock_location
    
    def adjust(rate, package)
      
    end
  end
end