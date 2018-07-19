Loan.create!(funded_amount: 100.0)

Payment.create!([{amount: 5.0, loan_id: 1},{amount: 10.0, loan_id: 1}])