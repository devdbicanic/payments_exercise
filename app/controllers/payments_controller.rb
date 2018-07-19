class PaymentsController < ApplicationController
	before_action :set_loan
	before_action :set_payment

	rescue_from ActiveRecord::RecordNotFound do |exception|
	  	render json: 'not_found', status: :not_found
	end

	def index
		render json: @loan.payments
	end

	def show
		render json: @payment
	end

	def create2
	    @loan.payments.create!(payment_params)
	   	render json: @payment
	end

	def create
		if Payment.validate_payment( @loan[:funded_amount], payment_params[:amount]) 
			@payment = @loan.payments.create!(payment_params)
			Payment.update_outstand_balance( @loan[:funded_amount], @payment[:amount])
			render json: @payment
		else
			render json: {errors: 'Payment_amount_exceeds_remaining_loan_balance'}
		end
	end

	private

	def payment_params
		params.permit(:amount)
	end

	def set_loan
		@loan = Loan.find(params[:loan_id])
	end

	def set_payment
		@payment = @loan.payments.find_by(id: params[:id]) if @loan
	end
end
