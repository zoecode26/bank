require 'transaction'

RSpec.describe Transaction do
  before(:example) do
    @account = BankAccount.new
  end

  describe '#deposit' do
    it 'adds money to the balance' do
      expect{@account.deposit(50)}.to change{@account.balance}.by(50)
    end

    it 'confirms to the user that money has been deposited' do
      expect{@account.deposit(50)}.to output("£50 deposited\n").to_stdout
    end
  end

  describe '#withdraw' do
    it 'deducts money from the balance' do
      @account.deposit(50)
      expect{@account.withdraw(10)}.to change{@account.balance}.by(-10)
    end

    it 'confirms to the user that money has been withdrawn' do
      @account.deposit(50)
      expect{@account.withdraw(10)}.to output("£10 withdrawn\n").to_stdout
    end

    it 'raises an error if you try to withdraw more than you have' do
      @account.deposit(5)
      message = "Balance too low"
      expect{@account.withdraw(10)}.to raise_error(message)
    end
  end
end
