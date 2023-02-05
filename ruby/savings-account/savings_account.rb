## year updated based on interest_rate
## interest_rate depends on amount of money
module SavingsAccount
  def self.interest_rate(balance)
    if balance < 0
      3.213
    elsif balance < 1000
      0.5
    elsif balance < 5000
      1.621
    else
      2.475
    end
  end

  def self.annual_balance_update(balance)
    interest_rate = interest_rate(balance)
    balance * (1 + interest_rate / 100)
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    year = 0
    until current_balance >= desired_balance
      current_balance = annual_balance_update(current_balance)
      year += 1
    end
    year
  end
end
