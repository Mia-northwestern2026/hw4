class EntriesController < ApplicationController

  def index
  end

  def new
    if @current_user
      @place = Place.find_by({ "id" => params["place_id"] })
    else
      redirect_to "/sessions/new", { :notice => "You must login to create an entry." }
    end
  end

  def create
    if @current_user
      @entry = Entry.new
      @entry["title"] = params["title"]
      @entry["description"] = params["description"]
      @entry["occurred_on"] = params["occurred_on"]
      @entry["place_id"] = params["place_id"]
      @entry["user_id"] = @current_user["id"]

      @entry.save

      redirect_to "/places/#{@entry["place_id"]}"
    else
      redirect_to "/sessions/new", { :notice => "You must login to create an entry." }
    end
  end

  def show
    @entry = Entry.find_by({ "id" => params["id"] })
  end

end
