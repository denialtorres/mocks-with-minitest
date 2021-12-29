class Customer < ApplicationRecord
  def monthly_fee
    case fee_type
    when "fixed"
      fee
    when "fixed_per_tenant"
      fee * tenants
    when "percentage"
      (fee / 100) * tenants * amount_per_tenant
    end
  end
end
