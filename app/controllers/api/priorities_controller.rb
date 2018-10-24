class Api::PrioritiesController < ApplicationController

   def index 
    @priorities = current_user.priorities
    render 'index.json.jbuilder'
   end

   def create 
     @priority = Priority.create(user_id: current_user.id,
                                 tag_id: params[:tag_id],
                                 percentage: params[:percentage]
                                )
     
     @priority.new_key
     @priority.removed_key
     @priority.changed_key
     @priority.total_change
     @priority.save
     render 'show.json.jbuilder'
   end
end
