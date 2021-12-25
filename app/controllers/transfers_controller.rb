class TransfersController < ApplicationController
  before_action :set_account

  def new
    @transfer = Transfer.new(source_account_id: @account.id)
  end

  def create
    @transfer = Transfer.new(transfer_params)

    if @transfer.save
      redirect_to @account
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_account
    @account = Account.find(params[:account_id])
  end

  def transfer_params
    params
      .require(:transfer)
      .permit(:source_account_id, :target_account_id, :amount)
      .merge(date: transfer_date)
  end

  def transfer_date
    Date.new(*transfer_date_args)
  end

  def transfer_date_args
    %w(1 2 3).map { |e| params[:transfer]["date(#{e}i)"].to_i }
  end
end
