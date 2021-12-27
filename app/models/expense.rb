class Expense
  include ActiveModel::Model
  attr_accessor :account, :date, :payee_name, :description, :amount
  validates_presence_of :account, :date, :payee_name, :amount

  def save
    if valid?
      account.transactions.create!(
        date: date,
        target_name: payee_name,
        description: description,
        amount: amount * -1
      )
    end
  end

  def amount=(value)
    @amount = value.to_i if value.present?
  end
end
