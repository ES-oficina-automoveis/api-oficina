require "test_helper"

class EstoquesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:admin)
    @estoque = estoques(:one)
  end

  test "should get index" do
    get estoques_url
    assert_response :success
  end

  test "should get new" do
    get new_estoque_url
    assert_response :success
  end

  test "should create estoque" do
    assert_difference("Estoque.count", 1) do
      post estoques_url, params: { estoque: { codigo: "NovoCodigo", quantidade: 1, peca_id: pecas(:one).id } }
    end

    assert_redirected_to estoque_url(Estoque.last)
  end

  test "should show estoque" do
    get estoque_url(@estoque)
    assert_response :success
  end

  test "should get edit" do
    get edit_estoque_url(@estoque)
    assert_response :success
  end

  test "should update estoque" do
    patch estoque_url(@estoque), params: { estoque: { codigo: @estoque.codigo, quantidade: @estoque.quantidade } }
    assert_redirected_to estoque_url(@estoque)
  end

  test "should destroy estoque" do
    assert_difference("Estoque.count", -1) do
      delete estoque_url(@estoque)
    end

    assert_redirected_to estoques_url
  end
end
