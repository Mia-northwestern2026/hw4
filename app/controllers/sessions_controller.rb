class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by({ "email" => params["email"] })

    if user
      if BCrypt::Password.new(user["password"]) == params["password"]
        session["user_id"] = user["id"]

        redirect_to "/places", { :notice => "Logged in successfully." }
      else
        redirect_to "/sessions/new", { :notice => "Invalid email or password." }
      end
    else
      redirect_to "/sessions/new", { :notice => "Invalid email or password." }
    end
  end

  def destroy
    session["user_id"] = nil

    redirect_to "/sessions/new", { :notice => "Logged out successfully." }
  end

  def show
    session["user_id"] = nil

    redirect_to "/sessions/new", { :notice => "Logged out successfully." }
  end

end