class ProfilesController < ApplicationController

  def link 
    @profile = Profile.find_by_token(params[:token])
    @fan = Fan.find_by_email_address(params[:email_address])
    if @fan.nil?
      redirect_to '/users/create'
    else
      @profile.update_attribute(:fan, @fan)
    end
  end
end
