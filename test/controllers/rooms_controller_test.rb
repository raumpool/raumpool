require 'test_helper'

class RoomsControllerTest < ActionController::TestCase

  def setup
    @room = rooms(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Room.count' do
      post :create, room: {
  beschreibung: "Lorem ipsum",
}
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Room.count' do
      delete :destroy, id: @room
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong room" do
    log_in_as(users(:test))
    room = rooms(:ants)
    assert_no_difference 'Room.count' do
      delete :destroy, id: room
    end
    assert_redirected_to root_url
  end

end
