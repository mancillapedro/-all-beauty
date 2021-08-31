require 'test_helper'

class SuplierUserSupliersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get suplier_user_supliers_index_url
    assert_response :success
  end

end
