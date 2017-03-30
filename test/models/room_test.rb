require 'test_helper'

class RoomTest < ActiveSupport::TestCase

  def setup
    @user = users(:test)
    @room = @user.rooms.build(name: 'name', strasse: 'strasse', nummer: 'nummer', plz: '81829', ort: 'münchen', groesse: '1', pers_anzahl: 10, preis: 'preis', anbieter: 'anbieter', kontakt_name: 'name', kontakt_email: 'email', kontakt_telefon: 'telefon', beschreibung: 'beschreibung')
  end

  test "should be valid" do
    assert @room.valid?
  end

  test "user id should be present" do
    @room.user_id = nil
    assert_not @room.valid?
  end

  test "name should be present " do
    @room.name = "   "
    assert_not @room.valid?
  end

  test "strasse should be present " do
    @room.strasse = "   "
    assert_not @room.valid?
  end

  test "nummer should be present " do
    @room.nummer = "   "
    assert_not @room.valid?
  end

  test "plz should be present " do
    @room.plz = "   "
    assert_not @room.valid?
  end

  test "ort should be present " do
    @room.ort = "   "
    assert_not @room.valid?
  end

  test "grösse should be present " do
    @room.groesse = "   "
    assert_not @room.valid?
  end

  test "preis should be present " do
    @room.preis = "   "
    assert_not @room.valid?
  end

  test "beschreibung should be present " do
    @room.beschreibung = "   "
    assert_not @room.valid?
  end

#  test "beschreibung should be at most 500 characters" do
#    @room.beschreibung = "a" * 501
#    assert_not @room.valid?
#  end

  test "order should be most recent first" do
    assert_equal Room.first, rooms(:most_recent)  # most_recent is name of fixture
  end
end
