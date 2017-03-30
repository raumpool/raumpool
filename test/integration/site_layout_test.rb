require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

def setup
  @admin = users(:test)
  @non_admin = users(:archer)
end

  test 'layout links' do
    get root_path
    assert_template 'static_pages/home'
      assert_select "a[href=?]", root_path, count: 3
      assert_select "a[href=?]", rooms_path, count: 3
      assert_select "a[href=?]", service_path
      assert_select "a[href=?]", faq_path
      assert_select "a[href=?]", login_path
      assert_select "a[href=?]", raumpool_path
      assert_select "a[href=?]", impressum_path
  end

  test 'links nach dem anmelden als ein nicht-admin' do
    log_in_as(@non_admin)
    get users_path
      assert_template 'users/index'
      assert_select "a[href=?]", rooms_path
      assert_select "a[href=?]", users_path, false
  end

  test 'links nach dem anmelden als ein admin' do
    log_in_as(@admin)
    get users_path
    assert_select "a[href=?]", rooms_path
    assert_select "a[href=?]", users_path
  end

end
