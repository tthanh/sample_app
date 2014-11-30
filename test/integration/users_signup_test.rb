require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: {
        name: "",
        email: "foo@invalid",
        password: "foo",
        password_confirmation: "bar"
      }
    end
    assert_template 'users/new'
    assert_select "div#error_explanation"
    assert_select "div.alert"
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count' do
      post_via_redirect users_path, user: {
        name: "ThanhVT",
        email: "unborn2010@gmail.com",
        password: "mashiro",
        password: "mashiro"
      }
    end
    assert_template 'users/new'
    assert is_logged_in?
  end
end
