class ExpensesController < ApplicationController
  before_action :set_account

  def new
    @expense = Expense.new(account: @account)
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.account = @account

    if @expense.save
      redirect_to @account
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def expense_params
    params.require(:expense)
      .permit(:payee_name, :description, :amount)
      .merge(date: date_from_params(:expense))
  end
end
