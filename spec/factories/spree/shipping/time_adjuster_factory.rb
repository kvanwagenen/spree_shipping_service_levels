FactoryGirl.define do
  factory :time_adjuster, class: Spree::Shipping::TimeAdjuster do
    initialize_with{new(['0','6'],['12/24','12/25'])}
  end
end