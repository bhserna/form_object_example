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

  def transfer_params
    params.require(:transfer)
      .permit(:source_account_id, :target_account_id, :amount)
      .merge(date: date_from_params(:transfer))
  end
end
