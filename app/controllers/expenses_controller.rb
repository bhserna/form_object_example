class ExpensesController < ApplicationController
  before_action :set_account

  def new
    @expense = Transaction.new
  end

  def create
    @expense = @account.transactions.build(inflow_params)

    if @expense.valid?
      @expense.amount = @expense.amount * -1
      @expense.save!
      redirect_to @account
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def inflow_params
    params.require(:transaction).permit(:date, :payee_name, :description, :amount)
  end

  def set_account
    @account = Account.find(params[:account_id])
  end
end
