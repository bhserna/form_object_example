class Account < ApplicationRecord
  has_many :transactions

  def balance
    transactions.sum(:amount)
  end
end
