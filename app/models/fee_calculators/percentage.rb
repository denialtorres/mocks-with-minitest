module FeeCalculators
  class Percentage < Base
    def call
      (fee / 100) * tenants * amount_per_tenant
    end
  end
end
