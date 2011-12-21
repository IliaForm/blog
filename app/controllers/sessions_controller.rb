class SessionsController < ApplicationController

	def new
	
    end

	def create
		if user = User.authenticate(params[:email], params[:password])
			session[:user_id] = user.id
			redirect_to root_path, :notice => "Logged in successfully"
		else
		    flash.now[:alert] = "Invalid email/password combination"
		    render 'new'
        end
    end

    def destroy
    	reset_session
    	redirect_to root_path, :notice => "You seccessfully loged out"
    end
end
