require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe '#monthly_fee' do
    context 'monthly_fee is fixed' do
      before do
        @customer = Customer.new(fee_type: 'fixed', fee: 100_00)
      end

      it 'should be equal to 100' do
        expect(@customer.monthly_fee).to eq(100_00)
      end
    end

    context 'monthly_fee is fixed_per_tenant' do
      before do
        @customer = Customer.new(fee_type: 'fixed_per_tenant',
                                 fee: 100_00,
                                 tenants: 9)
      end

      it 'should be equal to fee * tenants' do
        expect(@customer.monthly_fee).to eq(900_00)
      end
    end

    context 'monthly_fee is by percentage' do
      before do
        @customer = Customer.new(fee_type: 'percentage',
                                 fee: 10_00,
                                 tenants: 12,
                                 amount_per_tenant: 400)
      end

      it 'should be equal to 480' do
        expect(@customer.monthly_fee).to eq(480_00)
      end
    end
  end
end
