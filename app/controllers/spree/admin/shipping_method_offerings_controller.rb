class Spree::Admin::ShippingMethodOfferingsController < Spree::Admin::BaseController
  before_action :load_stock_location
  
  def index
    @offerings = @stock_location.shipping_method_offerings.joins(:shipping_method).where("spree_shipping_methods.name IS NOT NULL").order("spree_shipping_methods.name ASC")
  end
  
  def create
    @stock_location.shipping_method_offerings.create(offering_params)
    
    flash[:success] = "Shipping method added to stock location"
    
    redirect_to edit_admin_stock_location_path(@stock_location)
  end
  
  def destroy
    @offering = Spree::ShippingMethodOffering.find(params.require(:id))
    if @offering.destroy
      flash[:success] = "Shipping method successfully removed from stock location"
    end
    
    respond_with(@product) do |format|
      format.html { redirect_to edit_admin_stock_location_path(@stock_location) }
      format.js  { render partial: 'spree/admin/shared/destroy' }
    end
  end
  
  private
  
  def load_stock_location
    @stock_location = Spree::StockLocation.find(params.require(:stock_location_id))
  end
  
  def offering_params
    params.require(:shipping_method_offering).permit(:shipping_method_id, :stock_location_id)
  end
end
