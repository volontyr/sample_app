class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  	  # user loging in and redirecting to the user's show page
  	  log_in user
  	  redirect_to user
	else 
	  # creating an error message
	  flash.now[:danger] = 'Email or password is invalid'
  	  render 'new'
  	end
  end

  def destroy
  	log_out	
  	redirect_to root_url
  end	  
end
