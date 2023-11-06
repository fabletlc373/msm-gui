class DirectorsController < ApplicationController
  def index
    matching_directors = Director.all
    @list_of_directors = matching_directors.order({ :created_at => :desc })

    render({ :template => "director_templates/index" })
  end

  def add_director
    addname = params.fetch('dir_name')
    adddob = params.fetch('dir_dob')
    addbio = params.fetch('dir_bio')
    addimg = params.fetch('dir_img')
    
    newdir = Director.new
    newdir.image = addimg
    newdir.name = addname
    newdir.dob = adddob
    newdir.bio = addbio
    newdir.created_at = DateTime.now
    newdir.updated_at = DateTime.now

    newdir.save
    
    redirect_to("/directors")
  end
  
  def delete_director
    dirid = params.fetch('path_id')
    dir = Director.where({:id => dirid}).first
    dir.destroy
    redirect_to("/directors")
  end

  def modify_director
    dirid = params.fetch('path_id')
    addname = params.fetch('dir_name')
    adddob = params.fetch('dir_dob')
    addbio = params.fetch('dir_bio')
    addimg = params.fetch('dir_img')

    dir = Director.where({:id => dirid}).first

    dir.image = addimg
    dir.name = addname
    dir.dob = adddob
    dir.bio = addbio
    dir.updated_at = DateTime.now

    dir.save

    redirect_to("/directors/#{dirid}")
  end


  def show
    the_id = params.fetch("path_id")

    matching_directors = Director.where({ :id => the_id })
    @the_director = matching_directors.at(0)

    render({ :template => "director_templates/show" })
  end

  def max_dob
    directors_by_dob_desc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :desc })

    @youngest = directors_by_dob_desc.at(0)

    render({ :template => "director_templates/youngest" })
  end

  def min_dob
    directors_by_dob_asc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :asc })
      
    @eldest = directors_by_dob_asc.at(0)

    render({ :template => "director_templates/eldest" })
  end
end
