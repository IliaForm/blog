class SessionsController < ApplicationController

	def create
		if user = User.authenticate(params[:meail], params[:password])
			session[:user_id] = user.id
			redirect_to root_path, :notice => "Logged in successfully"
		esle
		    flash.now[:alert] = "Invalid email/password combination"
		    render :action => 'new'
        end
    end

    def destroy
    	reset_session
    	redirect_to root_path, :notice => "You seccessfully loged out"
    end
end
