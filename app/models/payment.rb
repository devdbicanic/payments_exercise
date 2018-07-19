class Payment < ApplicationRecord
  belongs_to :loan
  # Check that the payment doesn't exceed the loan balance
  # and that the payment is a positive number
  def self.validate_payment(funded_amount, payment_amount)
  	return payment_amount.to_f > 0 && funded_amount.to_f - payment_amount.to_f > 0 ? true : false
  end

  # Updates the loan so that the funded_amount reflects the new total
  def self.update_outstand_balance(funded_amount, payment_amount)
  	Loan.update( funded_amount: (funded_amount.to_f - payment_amount.to_f).round(2) )
  end
end
