class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all.where.not({ :director_id => nil })
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def add_movie
    addtitle = params.fetch('movie_title')
    addyear = params.fetch('movie_year')
    adddur = params.fetch('movie_dur')
    adddesc = params.fetch('movie_desc')
    addimg = params.fetch('movie_img')
    adddid = params.fetch('movie_dir')
    
    newmovie = Movie.new
    newmovie.title = addtitle
    newmovie.year = addyear
    newmovie.duration = adddur
    newmovie.description = adddesc
    newmovie.image = addimg
    newmovie.director_id = adddid
    newmovie.created_at = DateTime.now
    newmovie.updated_at = DateTime.now


    newmovie.save
    
    redirect_to("/movies")
  end

  def modify_movie
    movieid = params.fetch('path_id')
    addtitle = params.fetch('movie_title')
    addyear = params.fetch('movie_year')
    adddur = params.fetch('movie_dur')
    adddesc = params.fetch('movie_desc')
    addimg = params.fetch('movie_img')
    adddid = params.fetch('movie_dir')
    
    mov = Movie.where({:id => movieid}).first
    mov.title = addtitle
    mov.year = addyear
    mov.duration = adddur
    mov.description = adddesc
    mov.image = addimg
    mov.director_id = adddid
    mov.updated_at = DateTime.now


    mov.save
    
    redirect_to("/movies/#{movieid}")
  end


  def delete_movie
    movieid = params.fetch('path_id')
    mov = Movie.where({:id => movieid}).first
    mov.destroy
    
    redirect_to("/movies")
  end


end
