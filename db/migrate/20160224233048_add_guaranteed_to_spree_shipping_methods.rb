class AddGuaranteedToSpreeShippingMethods < ActiveRecord::Migration
  def change
    add_column :spree_shipping_methods, :guaranteed, :boolean, default: false
  end
end
