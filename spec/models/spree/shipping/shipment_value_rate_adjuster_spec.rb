require 'spec_helper'

module Spree
describe Shipping::ShipmentValueRateAdjuster, type: :model do
  let(:delivery_window){Spree::Shipping::DeliveryWindow.new(Time.now.beginning_of_day, Time.now.end_of_day)}
  let(:rate){Spree::ShippingRate.new(cost: 15.0, delivery_window: delivery_window)}
  let(:package){build(:stock_package_fulfilled)}
  let(:adjuster){Shipping::ShipmentValueRateAdjuster.new(max_shipment_value: 100.0, min_shipment_value: 0, delivery_window_days_adjustment: 1, flat_price_adjustment: 5.0)}
  context '#adjust' do
    context 'with a package valued in the range of the adjuster' do
      before do
        allow(package).to receive(:value).and_return(50.0)
      end
      it 'adjusts the rate cost by the correct amount' do
        adjuster.adjust(rate, package)
        expect(rate.cost).to eq(20.0)
      end
      it 'adjusts the rate delivery window by the correct amount of days' do
        adjuster.adjust(rate, package)
        expect(rate.delivery_window.start).to eq(Time.now.beginning_of_day + 1.day)
        expect(rate.delivery_window.end).to eq(Time.now.end_of_day + 1.day)
      end
    end
    context 'with a package valued outside the range of the adjuster' do
      before do
        allow(package).to receive(:value).and_return(101.0)
      end
      it 'does not adjust the rate cost' do
        adjuster.adjust(rate, package)
        expect(rate.cost).to eq(15.0)
      end
      it 'does not adjust the rate delivery window' do
        adjuster.adjust(rate, package)
        expect(rate.delivery_window.start).to eq(Time.now.beginning_of_day)
        expect(rate.delivery_window.end).to eq(Time.now.end_of_day)
      end
    end
  end
end
end