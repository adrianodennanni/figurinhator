require 'test_helper'

class FigurinhasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @figurinha = figurinhas(:one)
  end

  test "should get index" do
    get figurinhas_url
    assert_response :success
  end

  test "should get new" do
    get new_figurinha_url
    assert_response :success
  end

  test "should create figurinha" do
    assert_difference('Figurinha.count') do
      post figurinhas_url, params: { figurinha: { numero: @figurinha.numero, quantidade: @figurinha.quantidade, user_id: @figurinha.user_id } }
    end

    assert_redirected_to figurinha_url(Figurinha.last)
  end

  test "should show figurinha" do
    get figurinha_url(@figurinha)
    assert_response :success
  end

  test "should get edit" do
    get edit_figurinha_url(@figurinha)
    assert_response :success
  end

  test "should update figurinha" do
    patch figurinha_url(@figurinha), params: { figurinha: { numero: @figurinha.numero, quantidade: @figurinha.quantidade, user_id: @figurinha.user_id } }
    assert_redirected_to figurinha_url(@figurinha)
  end

  test "should destroy figurinha" do
    assert_difference('Figurinha.count', -1) do
      delete figurinha_url(@figurinha)
    end

    assert_redirected_to figurinhas_url
  end
end
