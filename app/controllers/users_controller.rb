class UsersController < ApplicationController
  def new
  end

  def create
  existing_user = User.find_by({ "email" => params["email"] })

  if existing_user
    redirect_to "/users/new", { :notice => "Email is already taken." }
  else
    @user = User.new
    @user["username"] = params["username"]
    @user["email"] = params["email"]
    @user["password"] = BCrypt::Password.create(params["password"])

    @user.save

    redirect_to "/sessions/new", { :notice => "Signup successful. Please login." }
  end
end

end

