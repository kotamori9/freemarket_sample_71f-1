require 'test_helper'

class CreditcardsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get creditcards_new_url
    assert_response :success
  end

  test "should get show" do
    get creditcards_show_url
    assert_response :success
  end

end
