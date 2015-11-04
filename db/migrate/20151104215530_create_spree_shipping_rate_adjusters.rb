class CreateSpreeShippingRateAdjusters < ActiveRecord::Migration
  def change
    create_table :spree_shipping_rate_adjusters do |t|
      t.belongs_to :stock_location
      t.string :type
      t.decimal :min_shipment_value
      t.decimal :max_shipment_value
      t.integer :delivery_window_days_adjustment
      t.decimal :flat_price_adjustment
    end
  end
end
