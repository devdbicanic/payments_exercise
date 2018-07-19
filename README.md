# Payments Exercise

Add in the ability to create payments for a given loan using a JSON API call. You should store the payment date and amount. Expose the outstanding balance for a given loan in the JSON vended for `LoansController#show` and `LoansController#index`. The outstanding balance should be calculated as the `funded_amount` minus all of the payment amounts.

A payment should not be able to be created that exceeds the outstanding balance of a loan. You should return validation errors if a payment can not be created. Expose endpoints for seeing all payments for a given loan as well as seeing an individual payment.

## My notes 

* First I tried to detemine what I was creating.
  * I wanted to first determine what DB schema I would need
        * It appeared it was a one to many relationship between a Loan can have many Payments
        * I ran the command "rails g model Payment amount:decimal loans:references"
        * This fits the need for a payment amount, and then the date would be the created date created by the timestamps    migration
   * I then determined what routes I would need.
          * To me I would want to see 
            * the payments made to a loan (index)
            * A single payment (show)
            * Have the ability to create a payment (create)
    * Once I did that I generated the Payments Controller
          * rails g controller Payments
          * I added the Index and Show methods in order to show a user all payments, or the payments belonging to a loan
    * I then moved to the Create function in the Payments Controller
           * The goal was to only make the payment if it was valid, so I created a method in the Payment model that returns true or false based on if the payment was above $0 (no need to make an insert for a negative or 0 payment) and that it did not exceed the total loan amount.
           * Once we get a true there we create the payment record
           * Then we update the Loan table with the new total using the Payment Model method update_outstand_balance
           * I then return the payment object
           * If the payment is no good, I give the user a friendly error explaining what happened.
           

        
