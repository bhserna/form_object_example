class InflowsController < ApplicationController
  before_action :set_account

  def new
    @inflow = Transaction.new
  end

  def create
    @inflow = @account.transactions.build(inflow_params)

    if @inflow.save
      redirect_to @account
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def inflow_params
    params.require(:transaction).permit(:date, :payer_name, :description, :amount)
  end
end
