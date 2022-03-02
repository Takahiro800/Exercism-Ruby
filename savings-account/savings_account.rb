module SavingsAccount
  def self.interest_rate(balance)
    case balance
    when ...0
      -3.213
    when 0...1000
      0.5
    when 1000...5000
      1.621
    else
      2.475
    end
  end

  def self.annual_balance_update(balance)
    balance * (100 + interest_rate(balance).abs)/100
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    years_before_desired_balance_helper(current_balance, desired_balance, 0)
  end

  private

  def self.years_before_desired_balance_helper(current_balance, desired_balance, years)
    if current_balance >= desired_balance
      years
    else
      years_before_desired_balance_helper(annual_balance_update(current_balance), desired_balance, years+1)
    end

  end
end

p SavingsAccount.annual_balance_update(-0.123)
p SavingsAccount.years_before_desired_balance(200.75, 214.88)
p SavingsAccount.interest_rate(-0.000_1)