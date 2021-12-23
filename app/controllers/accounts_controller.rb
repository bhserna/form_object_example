class AccountsController < ApplicationController
  def index
    @accounts = Account.all
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)

    if @account.save
      redirect_to @account, notice: "Account sucessfully created"
    else
      render :new, :unprocessable_entity
    end
  end

  def show
    @account = Account.find(params[:id])
  end

  private

  def account_params
    params.require(:account).permit(:name)
  end
end
