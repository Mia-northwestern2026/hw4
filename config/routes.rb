Rails.application.routes.draw do
  get("/", { :controller => "places", :action => "index" })

  resources "entries"
  resources "places"

  get("/logout", { :controller => "sessions", :action => "destroy" })
  resources "sessions"

  resources "users"
end