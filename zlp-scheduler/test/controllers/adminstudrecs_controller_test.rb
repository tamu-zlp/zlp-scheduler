require 'test_helper'

class AdminstudrecsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adminstudrec = adminstudrecs(:one)
  end

  test "should get index" do
    get adminstudrecs_url
    assert_response :success
  end

  test "should get new" do
    get new_adminstudrec_url
    assert_response :success
  end

  test "should create adminstudrec" do
    assert_difference('Adminstudrec.count') do
      post adminstudrecs_url, params: { adminstudrec: { classcode: @adminstudrec.classcode, email: @adminstudrec.email, major: @adminstudrec.major, name: @adminstudrec.name, uin: @adminstudrec.uin } }
    end

    assert_redirected_to adminstudrec_url(Adminstudrec.last)
  end

  test "should show adminstudrec" do
    get adminstudrec_url(@adminstudrec)
    assert_response :success
  end

  test "should get edit" do
    get edit_adminstudrec_url(@adminstudrec)
    assert_response :success
  end

  test "should update adminstudrec" do
    patch adminstudrec_url(@adminstudrec), params: { adminstudrec: { classcode: @adminstudrec.classcode, email: @adminstudrec.email, major: @adminstudrec.major, name: @adminstudrec.name, uin: @adminstudrec.uin } }
    assert_redirected_to adminstudrec_url(@adminstudrec)
  end

  test "should destroy adminstudrec" do
    assert_difference('Adminstudrec.count', -1) do
      delete adminstudrec_url(@adminstudrec)
    end

    assert_redirected_to adminstudrecs_url
  end
end
