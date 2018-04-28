require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "unsuccessful signup" do
    get signup_path
    assert_select 'form[action="/signup"]'
      assert_no_difference 'User.count'  do
        post signup_path, params: { user: { name:    "biz buzz",
                                           password: "foo bar",
                                           password_confirmation: ""}}
        end
        assert_template "users/new"
  end
  test "successful signup" do
    get signup_path
    assert_select 'form[action="/signup"]'
      assert_difference 'User.count', 1 do
        post signup_path, params: { user: { name:    "bizbuzz",
                                           password: "foobar",
                                           password_confirmation: "foobar"}}
        end
        follow_redirect!
        assert_template "users/show"
  end
end
