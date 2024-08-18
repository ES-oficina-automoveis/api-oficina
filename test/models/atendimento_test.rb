require "test_helper"

class AtendimentoTest < ActiveSupport::TestCase
  setup do
    @atendimento = atendimentos(:one)
    puts @atendimento.status.inspect
  end

  test "valid atendimento" do
    @atendimento = Atendimento.new(
      data_inicio: "2024-09-11 15:55:47",
      data_termino: "2024-09-17 18:55:47",
      status: :agendado,
      veiculo_id: 1
    )
    assert @atendimento.valid?
  end

  test "invalid without data_inicio" do
    @atendimento.data_inicio = nil
    assert_not @atendimento.valid?, "Atendimento is valid without a data_inicio"
  end

  test "invalid without data_termino" do
    @atendimento.data_termino = nil
    assert_not @atendimento.valid?, "Atendimento is valid without a data_termino"
  end

  test "invalid without status" do
    @atendimento.status = nil
    assert_not @atendimento.valid?, "Atendimento is valid without a status"
  end

  test "invalid with incorrect status" do
    assert_raises(ArgumentError) do
      @atendimento.status = "invalid_status"
    end
  end
end
