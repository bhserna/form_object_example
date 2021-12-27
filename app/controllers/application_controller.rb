class ApplicationController < ActionController::Base
  private

  def set_account
    @account = Account.find(params[:account_id])
  end

  def date_from_params(key)
    Date.new(*date_args_from_params(key))
  end

  def date_args_from_params(key)
    %w(1 2 3).map { |e| params[key]["date(#{e}i)"].to_i }
  end
end
