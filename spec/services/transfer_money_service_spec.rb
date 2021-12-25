require 'rails_helper'

RSpec.describe TransferMoneyService, type: :model do
  subject { TransferMoneyService }

  describe '#call' do
    # In addition to let, there’s let! .
    # The difference between the two is let won’t execute the code inside block
    # until it’s getting called, whereas let! will be immediately invoked.
    let(:sender){ create(:user) }
    let!(:sender_account) { create(:account, balance: 1_000, user: sender) }

    let(:receiver){ create(:user) }
    let!(:receiver_account) { create(:account, balance: 0, user: receiver) }

    before do
      subject.new(sender, receiver, 500).call
    end

    it 'substract sender money, add receiver money, create both transaction' do
      expect(sender_account.balance).to eq(500)
      expect(receiver_account.balance).to eq(500)
    end

    it 'checks that the transaction for the sender is right' do
      sender_transaction = Transaction.find_by(account_id: sender_account.id)

      expect(sender_transaction.initial_balance).to eq(1000)
      expect(sender_transaction.final_balance).to eq(500)
      expect(sender_transaction.sender_id).to eq(sender.id)
      expect(sender_transaction.receiver_id).to eq(receiver.id)
      expect(sender_transaction.status).to eq('completed')
    end

    it 'checks that the transaction for the receiver is right' do
      receiver_transaction = Transaction.find_by(account_id: receiver_account.id)
      
      expect(receiver_transaction.initial_balance).to eq(0)
      expect(receiver_transaction.final_balance).to eq(500)
      expect(receiver_transaction.sender_id).to eq(sender.id)
      expect(receiver_transaction.receiver_id).to eq(receiver.id)
      expect(receiver_transaction.status).to eq('completed')
    end
  end
end
