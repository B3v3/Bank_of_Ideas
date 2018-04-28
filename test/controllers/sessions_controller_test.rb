require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "invalid name and password should get error" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: {name: "", password: ""} }
    assert_template 'sessions/new'
    assert_not flash.empty?
  end

end
