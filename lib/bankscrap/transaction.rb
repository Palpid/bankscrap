module Bankscrap
  class Transaction
    include Utils::Inspectable

    attr_accessor :id, :amount, :description, :description_detail, :effective_date, :operation_date, :balance, :account

    def initialize(params = {})
      raise NotMoneyObjectError, :amount unless params[:amount].is_a?(Money)

      params.each { |key, value| send "#{key}=", value }
    end

    def to_s
      description
    end

    def to_a
      [id, effective_date.strftime('%d/%m/%Y'), description, description_detail, amount]
    end

    def currency
      amount.currency
    end

    private

    def inspect_attributes
      %i[id amount effective_date description balance]
    end
  end
end
