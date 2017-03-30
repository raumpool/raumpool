require 'test_helper'

class RoomsInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:test)
  end

  test "room interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    assert_select 'input[type="file"]'
    # Invalid submission
    assert_no_difference 'Room.count' do
      post rooms_path, room: { name: '', strasse: '', nummer: '', plz: '', ort: '', groesse: '', pers_anzahl: 1, preis: '', anbieter: '', kontakt_name: '', kontakt_email: '', kontakt_telefon: '', beschreibung: '', picture: '' }
    end
    assert_select 'div#error_explanation'
    # Valid submission
    name = 'name'
    strasse = 'strasse'
    nummer = '7'
    plz = '88555'
    ort = 'münchen'
    groesse = '2'
    pers_anzahl = 10
    preis = 'viel'
    anbieter = 'anbieter'
    kontakt_name = 'kontakt name'
    kontakt_email = 'kontakt email'
    kontakt_telefon = 'kontakt telefon'
    beschreibung = "This room really ties"
    picture = fixture_file_upload('test/fixtures/raumpool_logo.jpg', 'image/jpeg')
    assert_difference 'Room.count', 1 do
      post rooms_path, room: { name: name, strasse: strasse, nummer: nummer, plz: plz, ort: ort, groesse: groesse, pers_anzahl: pers_anzahl, preis: preis, anbieter: anbieter, kontakt_name: kontakt_name, kontakt_email: kontakt_email, kontakt_telefon: kontakt_telefon, beschreibung: beschreibung, picture: picture }
    end
    assert_redirected_to root_url
    assert @user.rooms.first.picture?
    follow_redirect!
    assert_match beschreibung, response.body
    # Delete a post.
    assert_select 'a', text: 'löschen'
    first_room = @user.rooms.paginate(page: 1).first
    assert_difference 'Room.count', -1 do
      delete room_path(first_room)
    end
    # Visit a different user.
    get user_path(users(:archer))
    assert_select 'a', text: 'delete', count: 0
  end

  test "room sidebar count" do
    log_in_as(@user)
    get root_path
    assert_match "( #{@user.rooms.count} )", response.body
    # User with zero rooms
    other_user = users(:mallory)
    log_in_as(other_user)
    get root_path
    assert_match "( 0 )", response.body
    other_user.rooms.create!( name: "Lorem", strasse: "a", nummer: "1", plz: "84444", ort: "munchen", groesse: "2", pers_anzahl: 10, preis: "unbezahlbar", anbieter: "anbieter", kontakt_name: "de", kontakt_email: "de@de.de", kontakt_telefon: "08955555", beschreibung: "Lorem ipsum" )
    get root_path
    assert_match "( #{other_user.rooms.count} )", response.body
  end
end
