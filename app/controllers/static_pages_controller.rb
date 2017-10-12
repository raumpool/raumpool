class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @room  = current_user.rooms.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def faq
  end

  def formulare
  end
  
  def kontakt
  end
  
  def impressum
  end

  def service
  end

  def raumpool
  end
end
