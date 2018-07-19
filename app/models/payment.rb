class Payment < ApplicationRecord
  belongs_to :loan

  def self.validate_payment(payment_arr)

  end
end
