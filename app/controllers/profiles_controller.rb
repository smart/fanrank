class ProfilesController < ApplicationController

  def create 
    @profile = Profile.find_or_create_by_type_and_identifier( params[:profile][:type], params[:profile][:identifier] )
  end
  
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
