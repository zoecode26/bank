class Transaction
  def initialize(bank_account)
    @account = bank_account
    @date = Time.now.strftime("%d/%m/%Y")
  end

  def deposit(amount)
    @account.balance += amount
    puts "£#{amount} deposited"
    @account.transactions << {"Date" => @date, "Deposit" => amount, "Balance" => @account.balance}
  end

  def withdraw(amount)
    raise "Balance too low" if !allowed?(amount)
    @account.balance -= amount
    puts "£#{amount} withdrawn"
    @account.transactions << {"Date" => @date, "Withdraw" => amount, "Balance" => @account.balance}
  end

  def allowed?(amount)
    @account.balance - amount >= 0
  end
end
