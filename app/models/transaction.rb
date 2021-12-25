class Transaction < ApplicationRecord
  belongs_to :account
  validates_presence_of :date, :target_name, :amount

  alias_attribute :payer_name, :target_name
  alias_attribute :payee_name, :target_name

  def self.transfer(date:, source_account:, target_account:, amount:)
    transaction do
      create(
        date: date,
        account: source_account,
        target_name: target_account.name,
        description: "Transfer to #{target_account.name}",
        amount: -1 * amount
      )

      create(
        date: date,
        account: target_account,
        target_name: source_account.name,
        description: "Transfer from #{source_account.name}",
        amount: amount
      )
    end
  end

  def inflow
    amount if amount > 0
  end

  def outflow
    amount if amount < 0
  end
end
