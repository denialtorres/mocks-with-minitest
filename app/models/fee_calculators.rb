module FeeCalculators
  def self.monthly_fee(customer)
    klass = "FeeCalculators::#{customer.fee_type.classify}".constantize
    klass.new(customer).call
  end
end
