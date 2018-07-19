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

	def create

	end

	private

	def set_loan
		@loan = Loan.find(params[:loan_id])
	end

	def set_payment
		@payment = @loan.payments.find_by(id: params[:id]) if @loan
	end
end
