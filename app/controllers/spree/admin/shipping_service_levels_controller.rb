module Spree
  class Admin::ShippingServiceLevelsController < Admin::ResourceController
    belongs_to 'spree/stock_location', :find_by => :id
    
    def index
      
    end
    
  end
end