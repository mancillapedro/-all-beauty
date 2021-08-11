require 'test_helper'

class SupliersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get supliers_show_url
    assert_response :success
  end

end
