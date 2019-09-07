# frozen_string_literal: true

module TransactionsDoc
  extend Apipie::DSL::Concern
  api :POST, '/transactions'
  formats %w[json xml]
  param :user_id, Integer, desc: 'User ID', required: true
  param :amount, BigDecimal, desc: 'Transaction Amount', required: true
  example <<-EOS
  {
    "status": 200,
    "message": {
        "transaction": {
            "id": 69,
            "amount": "100.0",
            "status": "processed",
            "user_id": 10,
            "uuid": "f9015c36-1363-40b3-b017-ac2317cad24b"
        }
    }
  }
  EOS
  example <<-EOS
  {
    "status": 422,
    "message": {
        "transaction": {
            "id": 71,
            "amount": "0.0",
            "status": "error",
            "user_id": 10,
            "uuid": "160ee80f-1d7d-4f6f-b5a4-6f8476213463"
        }
    }
  }
  EOS

  def create; end
end
