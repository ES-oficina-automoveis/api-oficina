json.extract! cliente, :id, :nome, :email, :telefone, :cpf, :endereco, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
