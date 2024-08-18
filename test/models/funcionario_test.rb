require "test_helper"

class FuncionarioTest < ActiveSupport::TestCase
  setup do
    @funcionario = funcionarios(:one)
  end

  test "should be valid with valid attributes" do
    assert @funcionario.valid?
  end

  test "should not be valid without matricula" do
    @funcionario.matricula = nil
    assert_not @funcionario.valid?
    assert_includes @funcionario.errors[:matricula], "não pode ficar em branco"
  end

  test "should not be valid without nome" do
    @funcionario.nome = nil
    assert_not @funcionario.valid?
    assert_includes @funcionario.errors[:nome], "não pode ficar em branco"
  end

  test "should not be valid with short nome" do
    @funcionario.nome = "Jo"
    assert_not @funcionario.valid?
    assert_includes @funcionario.errors[:nome], "é muito curto (mínimo: 3 caracteres)"
  end

  test "should not be valid without cargo" do
    @funcionario.cargo = nil
    assert_not @funcionario.valid?
    assert_includes @funcionario.errors[:cargo], "não pode ficar em branco"
  end

  test "should not be valid without email" do
    @funcionario.email = nil
    assert_not @funcionario.valid?
    assert_includes @funcionario.errors[:email], "não pode ficar em branco"
  end

  test "should not be valid without salario" do
    @funcionario.salario = nil
    assert_not @funcionario.valid?
    assert_includes @funcionario.errors[:salario], "não pode ficar em branco"
  end

  test "should not be valid without data_admissao" do
    @funcionario.data_admissao = nil
    assert_not @funcionario.valid?
    assert_includes @funcionario.errors[:data_admissao], "não pode ficar em branco"
  end

  test "should not be valid without cpf" do
    @funcionario.cpf = nil
    assert_not @funcionario.valid?
    assert_includes @funcionario.errors[:cpf], "não pode ficar em branco"
  end

  test "should not be valid with incorrect cpf length" do
    @funcionario.cpf = "1234567890"  # CPF com 10 dígitos, inválido
    assert_not @funcionario.valid?
    assert_includes @funcionario.errors[:cpf], "é muito curto (mínimo: 11 caracteres)"
  end
end
