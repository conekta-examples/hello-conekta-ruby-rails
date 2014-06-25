require 'test_helper'

class CheckoutsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get charge" do
    get :charge
    assert_response :success
  end

end
