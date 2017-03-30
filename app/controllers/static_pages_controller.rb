class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @room  = current_user.rooms.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def faq
  end

  def impressum
  end

  def service
  end

  def kontakt
  end

  def raumpool
  end
end
