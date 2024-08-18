require "test_helper"

class ServicoTest < ActiveSupport::TestCase
  fixtures :servicos

  setup do
    @servico = servicos(:one)
  end

  test "deve ser válido" do
    assert @servico.valid?, "Erro: #{@servico.errors.full_messages.join(', ')}"
  end

  test "codigo deve estar presente" do
    @servico.codigo = "   "
    assert_not @servico.valid?
  end

  test "nome deve estar presente" do
    @servico.nome = "   "
    assert_not @servico.valid?
  end

  test "descricao deve estar presente" do
    @servico.descricao = "   "
    assert_not @servico.valid?
  end

  test "descricao não deve ser maior que 100 caracteres" do
    @servico.descricao = "a" * 101
    assert_not @servico.valid?
  end

  test "preco deve estar presente" do
    @servico.preco = nil
    assert_not @servico.valid?
  end

  test "associação com atendimentos" do
    assert_respond_to @servico, :atendimentos
  end
end
