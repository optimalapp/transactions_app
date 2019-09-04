module UsersDoc
  extend Apipie::DSL::Concern
  api :POST, '/users/:id/transaction'
  formats ['json', 'xml']
  example <<-EOS
  {"amount":"100.00"}
  EOS
  example <<-EOS
  <amount>100</amount>
  EOS
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
  {"amount":"qwerty"}
  EOS
  example <<-EOS
  <amount>qwerty</amount>
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

  def transaction; end
end
