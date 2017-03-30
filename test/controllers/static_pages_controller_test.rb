require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Raumpool"
  end

  test "should get service" do
    get :service
    assert_response :success
    assert_select "title", "Service | Raumpool"
  end

  test "should get faq" do
    get :faq
    assert_response :success
    assert_select "title", "FAQ | Raumpool"
  end

  test "should get über den raumpool" do
    get :raumpool
    assert_response :success
    assert_select "title", "Über den Raumpool | Raumpool"
  end

  test "should get impressum" do
    get :impressum
    assert_response :success
    assert_select "title", "Kontakt und Impressum | Raumpool"
  end

end
