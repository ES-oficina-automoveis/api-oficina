require "test_helper"

class PecaTest < ActiveSupport::TestCase
  setup do
    @peca = pecas(:one)
  end

  test "should be valid with valid attributes" do
    assert @peca.valid?
  end

  test "should not be valid without codigo" do
    @peca.codigo = nil
    assert_not @peca.valid?
    assert_includes @peca.errors[:codigo], "não pode ficar em branco"
  end

  test "should not be valid with duplicate codigo" do
    duplicate_peca = @peca.dup
    @peca.save
    assert_not duplicate_peca.valid?
    assert_includes duplicate_peca.errors[:codigo], "já está em uso"
  end

  test "should not be valid without nome" do
    @peca.nome = nil
    assert_not @peca.valid?
    assert_includes @peca.errors[:nome], "não pode ficar em branco"
  end

  test "should not be valid with short nome" do
    @peca.nome = "A"
    assert_not @peca.valid?
    assert_includes @peca.errors[:nome], "é muito curto (mínimo: 2 caracteres)"
  end

  test "should not be valid with long nome" do
    @peca.nome = "A" * 21
    assert_not @peca.valid?
    assert_includes @peca.errors[:nome], "é muito longo (máximo: 20 caracteres)"
  end

  test "should not be valid without preco" do
    @peca.preco = nil
    assert_not @peca.valid?
    assert_includes @peca.errors[:preco], "não pode ficar em branco"
  end

  test "should not be valid without tipo" do
    @peca.tipo = nil
    assert_not @peca.valid?
    assert_includes @peca.errors[:tipo], "não pode ficar em branco"
  end

  test "should not be valid without fabricante" do
    @peca.fabricante = nil
    assert_not @peca.valid?
    assert_includes @peca.errors[:fabricante], "não pode ficar em branco"
  end

  test "should not be valid without data_validade" do
    @peca.data_validade = nil
    assert_not @peca.valid?
    assert_includes @peca.errors[:data_validade], "não pode ficar em branco"
  end
end
