class Transfer
  include ActiveModel::Model
  attr_accessor :date, :source_account_id, :target_account_id, :amount
  validates_presence_of :date, :source_account_id, :target_account_id, :amount

  def target_options
    Account.where.not(id: source_account_id)
  end

  def save
    if valid?
      Transaction.transfer(
        date: date,
        source_account: Account.find(source_account_id),
        target_account: Account.find(target_account_id),
        amount: amount
      )
    end
  end

  def amount=(value)
    @amount = value.to_i if value.present?
  end
end
