Deface::Override.new(
  virtual_path: 'spree/admin/shipping_methods/_form',
  name: 'Add guaranteed to shipping methods form',
  insert_after: 'div[data-hook=admin_shipping_method_form_tracking_url_field]',
  partial: "spree/admin/shipping_methods/guaranteed_field"
)