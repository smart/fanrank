class HomeController < ApplicationController
  
  def index
    @fans = Fan.top_100
  end
  
  def twitter
    @profiles = Profile.top_100
  end
  
end
