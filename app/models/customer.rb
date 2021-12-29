class Customer < ApplicationRecord
  def monthly_fee
    FeeCalculators.monthly_fee(self)
  end
end
