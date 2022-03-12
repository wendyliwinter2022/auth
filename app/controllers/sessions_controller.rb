class SessionsController < ApplicationController
    def new

    end

    def create
        @user = User.where({email: params["email"]})[0]

        if @user
            #BCrypt::Password.create(params["user"]["password"])
            if BCrypt::Password.new(@user.password) == params["password"]
               flash[:notice] = "Logged in!"
                redirect_to "/companies" 
            else    
                flash[:notice] = "Wrong password"
                redirect_to "/sessions/new"  
            end 
        else
            flash[:notice] = "Wrong User"
            redirect_to "/sessions/new"  
        end
    end 
end
