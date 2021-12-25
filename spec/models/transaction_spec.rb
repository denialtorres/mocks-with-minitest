require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let(:user){ create(:user) }
  let(:account){ create(:account, user: user) }

  describe '#completed?' do
    context 'when a transaction is already completed' do
      it 'return true' do
        transaction = create(:transaction, account: account, status: "completed")

        expect(transaction.completed?).to eq(true)
      end
    end

    context 'when a transaction is not completed' do
      it 'return false' do
        transaction = create(:transaction, account: account )

        expect(transaction.completed?).to eq(false)
      end
    end
  end

  describe '#pending?' do
    context 'when a transaction is pending' do
      it 'return true' do
        transaction = create(:transaction, account: account)
        expect(transaction.pending?).to eq(true)
      end
    end

    context 'when a transaction is not pending' do
      it 'return false' do
        transaction = create(:transaction, account: account, status: 'failed')

        expect(transaction.pending?).to eq(false)
      end
    end
  end

  describe '#failed?' do
    context 'when a transaction failed' do
      it 'return true' do
        transaction = create(:transaction, account: account)
        transaction.status = 'failed'
        expect(transaction.failed?).to eq(true)
      end
    end

    context 'when a transaction do not fail' do
      it 'return false' do
        transaction = create(:transaction, account: account)

        expect(transaction.failed?).to eq(false)
      end
    end
  end
end
