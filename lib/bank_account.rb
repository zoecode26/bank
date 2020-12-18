require_relative 'transaction'

class BankAccount
  attr_accessor :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    Transaction.new(self).deposit(amount)
  end

  def withdraw(amount)
    Transaction.new(self).withdraw(amount)
  end

  def statement
    @transactions.reverse.each do |transaction|
      transaction.each do |k,v|
        puts "#{k}:#{v}"
      end
      puts
    end
  end
end
