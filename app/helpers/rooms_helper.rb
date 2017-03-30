module RoomsHelper
  
    # Returns the Gravatar for the given room.
  def room_gravatar_for(room, options = { size: 80 })
    #gravatar_name = room.name
    size = options[:size]
#    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
#    image_tag(gravatar_url, alt: user.name, class: "gravatar")
     if room.picture.size != 0
       image_tag( room.picture, class: "gravatar", size: '40x40', alt: room.name )
     else
       image_tag( 'raumpool_logo_klein.jpg', class: "gravatar", size: '40x40' )
     end
  end
  
  
end
