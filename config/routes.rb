Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })

  get("/directors", { :controller => "directors", :action => "index" })
  get("/directors/:path_id", { :controller => "directors", :action => "show" })
  get("/delete_director/:path_id", { :controller => "directors", :action => "delete_director" })
  post("/modify_director/:path_id", { :controller => "directors", :action => "modify_director" })
  post("/insert_director", { :controller => "directors", :action => "add_director" })
  

  #movies
  get("/movies", { :controller => "movies", :action => "index" })
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  get("/delete_movie/:path_id", { :controller => "movies", :action => "delete_movie" })
  post("/modify_movie/:path_id", { :controller => "movies", :action => "modify_movie" })
  post("/insert_movie", { :controller => "movies", :action => "add_movie"})
  



  # actors
  get("/actors", { :controller => "actors", :action => "index" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })
  
  get("/delete_actor/:path_id", { :controller => "actors", :action => "delete_actor" })
  post("/modify_actor/:path_id", { :controller => "actors", :action => "modify_actor" })
  post("/insert_actor", { :controller => "actors", :action => "add_actor" })
end
