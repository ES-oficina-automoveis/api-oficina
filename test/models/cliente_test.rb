require "test_helper"

class ClienteTest < ActiveSupport::TestCase
  setup do
    @cliente = clientes(:one)
  end

  test "valid cliente" do
    assert @cliente.valid?
  end

  test "invalid without nome" do
    @cliente.nome = nil
    assert_not @cliente.valid?, "Cliente is valid without a nome"
  end

  test "invalid without email" do
    @cliente.email = nil
    assert_not @cliente.valid?, "Cliente is valid without an email"
  end

  test "invalid without telefone" do
    @cliente.telefone = nil
    assert_not @cliente.valid?, "Cliente is valid without a telefone"
  end

  test "invalid without cpf" do
    @cliente.cpf = nil
    assert_not @cliente.valid?, "Cliente is valid without a cpf"
  end

  test "invalid without endereco" do
    @cliente.endereco = nil
    assert_not @cliente.valid?, "Cliente is valid without an endereco"
  end

  test "email must be unique" do
    duplicate_cliente = @cliente.dup
    assert_not duplicate_cliente.valid?, "Cliente is valid with a duplicate email"
  end
end
