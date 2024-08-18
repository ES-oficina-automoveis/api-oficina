require "test_helper"

class VeiculoTest < ActiveSupport::TestCase
  setup do
    @veiculo = veiculos(:one)
  end

  test "valid veiculo" do
    assert @veiculo.valid?
  end

  test "invalid without placa" do
    @veiculo.placa = nil
    assert_not @veiculo.valid?, "Veiculo is valid without a placa"
  end

  test "invalid without modelo" do
    @veiculo.modelo = nil
    assert_not @veiculo.valid?, "Veiculo is valid without a modelo"
  end

  test "invalid without ano" do
    @veiculo.ano = nil
    assert_not @veiculo.valid?, "Veiculo is valid without an ano"
  end

  test "invalid without cor" do
    @veiculo.cor = nil
    assert_not @veiculo.valid?, "Veiculo is valid without a cor"
  end

  test "invalid without quilometragem" do
    @veiculo.quilometragem = nil
    assert_not @veiculo.valid?, "Veiculo is valid without a quilometragem"
  end

  test "invalid without chassi" do
    @veiculo.chassi = nil
    assert_not @veiculo.valid?, "Veiculo is valid without a chassi"
  end

  test "invalid with duplicate placa" do
    duplicate_veiculo = @veiculo.dup
    assert_not duplicate_veiculo.valid?, "Veiculo is valid with a duplicate placa"
  end

  test "invalid with short placa" do
    @veiculo.placa = "AB123"
    assert_not @veiculo.valid?, "Veiculo is valid with a short placa"
  end

  test "invalid with long placa" do
    @veiculo.placa = "AB1234567890"
    assert_not @veiculo.valid?, "Veiculo is valid with a long placa"
  end

  test "invalid with short chassi" do
    @veiculo.chassi = "12345"
    assert_not @veiculo.valid?, "Veiculo is valid with a short chassi"
  end

  test "invalid with long chassi" do
    @veiculo.chassi = "A" * 51
    assert_not @veiculo.valid?, "Veiculo is valid with a long chassi"
  end
end
