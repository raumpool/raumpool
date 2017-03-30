require 'test_helper'

class RoomsSearchTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:test)
  end

  test "search page" do
    get rooms_path
    assert_response :success
    assert assigns(:rooms)
    assert_select 'div.pagination'
    assert_match "Räume", response.body
    assert_match "#{@user.rooms.count}", "36"  # as many rooms in rooms.yml
  end

  test "veranstaltungsraum search" do
    get rooms_path, q: { name_or_beschreibung_cont: "veranstaltungsraum" }
    assert_match "Räume ( 1 )", response.body
  end

  test "medienraum search" do
    get rooms_path, q: { name_or_beschreibung_cont: "medienraum" }
    assert_match "Räume ( 1 )", response.body
  end

  test "strasse search" do
    get rooms_path, q: { strasse_cont: "strasse" }
    assert_match "Räume ( 40 )", response.body
  end

  test "grösse search" do
    get rooms_path, q: { groesse_gteq: 40, groesse_lteq: 60 }
    assert_match "Räume ( 2 )", response.body
  end

  test "personen search" do
    get rooms_path, q: { pers_anzahl_gteq: 50 }
    assert_match "Räume ( 2 )", response.body
  end

  test "wlan search" do
    get rooms_path, q: { technik_wlan_true: true }
    assert_match "Räume ( 2 )", response.body
  end

  test "mikro search" do
    get rooms_path, q: { technik_mikro_true: true }
    assert_match "Räume ( 2 )", response.body
  end

end
