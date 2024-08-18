require "test_helper"

class ClientesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cliente = clientes(:one)
  end

  test "should get index" do
    get clientes_url
    assert_response :success
  end

  test "should get new" do
    get new_cliente_url
    assert_response :success
  end

  test "should create cliente" do
    assert_difference("Cliente.count") do
      post clientes_url, params: { cliente: {
        cpf: '12345678910',
        email: 'novoemail@gmail.com',
        endereco: 'Novo Endereco',
        nome: 'Novo Cliente',
        telefone: '87999999977'
      } }
    end

    assert_redirected_to cliente_url(Cliente.last)
  end

  test "should show cliente" do
    get cliente_url(@cliente)
    assert_response :success
  end

  test "should get edit" do
    get edit_cliente_url(@cliente)
    assert_response :success
  end

  test "should update cliente" do
    patch cliente_url(@cliente), params: { cliente: { cpf: @cliente.cpf, email: @cliente.email, endereco: @cliente.endereco, nome: @cliente.nome, telefone: @cliente.telefone } }
    assert_redirected_to cliente_url(@cliente)
  end

  test "should destroy cliente and associated veiculos" do
    cliente = Cliente.create!(nome: 'Joao', email: 'unique_email_#{SecureRandom.hex(4)}@gmail.com', telefone: '87999999999', cpf: '12345678888', endereco: 'Ruaseila')

    veiculo = cliente.veiculos.create!(placa: 'XOL5678', modelo: 'Ferrari', ano: 2006, cor: 'vermelho', quilometragem: 10000, chassi: '8N2DhvhuKE0W45966')

    assert_difference('Cliente.count', -1) do
      assert_difference('Veiculo.count', -1) do
        delete cliente_url(cliente)
      end
    end

    assert_redirected_to clientes_url
  end
end
