require 'test_helper'

class IdeaAddingTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
  end

  test "adding idea without being logged in" do
    get new_path
    assert_redirected_to root_path
  end

  test "adding idea with being logged in" do
    log_in_as @user
    get new_path
    assert_template "idea/new"
    assert_difference "Idea.count", 1 do
      post new_path params: {idea: { title: "example",
                                      body: "example body" }}
  end
  follow_redirect!
  assert_template "idea/show"
end

test "adding idea with wrong params" do
  log_in_as @user
  get new_path
  assert_template "idea/new"
  assert_no_difference "Idea.count" do
    post new_path params: {idea: { title: "", #wrong title
                                    body: "example body" }}
end
assert_template "idea/new"

assert_no_difference "Idea.count" do #wrong body
  post new_path params: {idea: { title: "title",
                                  body: "" }}
end
assert_template "idea/new"

assert_difference "Idea.count", 1 do #same ideas
  post new_path params: {idea: { title: "title",
                                  body: "example body" }}
post new_path params: {idea: { title: "title",
                               body: "example body" }}
end
assert_template "idea/new"
end

end
