class Transaction < ApplicationRecord
  belongs_to :account

  alias_attribute :payer_name, :target_name
  alias_attribute :payee_name, :target_name

  def inflow
    amount if amount > 0
  end

  def outflow
    amount if amount < 0
  end
end
