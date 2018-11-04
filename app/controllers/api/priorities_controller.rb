class Api::PrioritiesController < ApplicationController

   def index 
    @priorities = current_user.priorities
    render 'index.json.jbuilder'
   end

   def create 
    old_priorities = current_user.priorities_hash
    p old_priorities

    @priority = Priority.create(user_id: current_user.id,
                               tag_id: params[:tag_id],
                               percentage: params[:percentage]
                              )

    modified_priorities = current_user.priorities_hash
    p modified_priorities

    new_priorities = current_user.total_change(old_priorities, modified_priorities)

    
    render 'show.json.jbuilder'
   end
end
