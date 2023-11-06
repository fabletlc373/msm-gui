class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end

  def add_actor
    addname = params.fetch('act_name')
    adddob = params.fetch('act_dob')
    addbio = params.fetch('act_bio')
    addimg = params.fetch('act_img')
    
    newact = Actor.new
    newact.image = addimg
    newact.name = addname
    newact.dob = adddob
    newact.bio = addbio
    newact.created_at = DateTime.now
    newact.updated_at = DateTime.now

    newact.save
    
    redirect_to("/actors")
  end

  def delete_actor
    actid = params.fetch('path_id')
    act = Actor.where({:id => actid}).first
    act.destroy
    redirect_to("/actors")
  end

  def modify_actor
    actid = params.fetch('path_id')
    addname = params.fetch('act_name')
    adddob = params.fetch('act_dob')
    addbio = params.fetch('act_bio')
    addimg = params.fetch('act_img')
    

    act = Actor.where({:id => actid}).first

    act.image = addimg
    act.name = addname
    act.dob = adddob
    act.bio = addbio
    act.updated_at = DateTime.now

    act.save

    redirect_to("/actors/#{actid}")
  end

end
