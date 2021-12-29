module FeeCalculators
  class FixedPerTenant < Base
    def call
      fee * tenants
    end
  end
end
