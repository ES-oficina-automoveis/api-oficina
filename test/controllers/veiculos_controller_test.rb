require "test_helper"

class VeiculosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @veiculo = veiculos(:one)
  end

  test "should get index" do
    get veiculos_url
    assert_response :success
  end

  test "should get new" do
    get new_veiculo_url
    assert_response :success
  end

  test "should create veiculo" do
    assert_difference("Veiculo.count", 1) do
      post veiculos_url, params: { veiculo: { ano: 2024, chassi: 'NEWCHAI1456789345', cor: 'azul', modelo: 'Novo Modelo', placa: 'NEW1234', quilometragem: 5000, cliente_id: 1 } }
    end
    assert_response :redirect
    veiculo = Veiculo.last
    assert_equal 'NEWCHAI1456789345', veiculo.chassi
    assert_equal 'azul', veiculo.cor
    assert_equal 'Novo Modelo', veiculo.modelo
    assert_equal 'NEW1234', veiculo.placa
    assert_equal 5000, veiculo.quilometragem
    assert_equal 1, veiculo.cliente_id
  end


  test "should show veiculo" do
    get veiculo_url(@veiculo)
    assert_response :success
  end

  test "should get edit" do
    get edit_veiculo_url(@veiculo)
    assert_response :success
  end

  test "should update veiculo" do
    patch veiculo_url(@veiculo), params: { veiculo: { ano: @veiculo.ano, chassi: @veiculo.chassi, cor: @veiculo.cor, modelo: @veiculo.modelo, placa: @veiculo.placa, quilometragem: @veiculo.quilometragem } }
    assert_redirected_to veiculo_url(@veiculo)
  end

  test "should destroy veiculo without atendimentos" do
    veiculo_to_destroy = veiculos(:tree)

    assert_empty veiculo_to_destroy.atendimentos, "Veículo tem atendimentos associados"

    assert_difference("Veiculo.count", -1) do
      delete veiculo_url(veiculo_to_destroy)
    end

    assert_raises(ActiveRecord::RecordNotFound) do
      Veiculo.find(veiculo_to_destroy.id)
    end

    assert_redirected_to veiculos_url
  end
end
