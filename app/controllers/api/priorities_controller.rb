class Api::PrioritiesController < ApplicationController

   def index 
    @priorities = current_user.priorities
    render 'index.json.jbuilder'
   end


   # def change 
   #  old_priorities = current_user.priorities_hash

   #  if old_priorities.sum {|priority_name, percentage| percentage } != 100 #keep this check
      
   #    new_value = Priority.create(tag_id: params[:tag_id], percentage: params[:percentage])

   #    modified_priorities = current_user.priorities_hash 
   #    new_priorities = current_user.total_change(modified_priorities, new_value)

   #    new_priorities.each do |tag_name, new_percentage|
   #      tag = Tag.find_by(name: tag_name) 
   #      priority = current_user.priorities.find_by(tag_id: tag.id)
   #      priority.percentage = new_percentage
   #      priority.save
   #    end

   #  else
   #    priority = Priority.find_or_create_by(tag_id: params[:tag_id], user_id: current_user.id) 
   #    priority.update(percentage: params[:percentage])
   #    priority.destroy if priority.percentage == 0

   #    modified_priorities = current_user.priorities_hash

   #    new_priorities = current_user.total_change(old_priorities, modified_priorities)

   #    new_priorities.each do |tag_name, new_percentage|
   #      tag = Tag.find_by(name: tag_name) 
   #      priority = current_user.priorities.find_by(tag_id: tag.id)
   #      priority.percentage = new_percentage
   #      priority.save
   #    end

   #    @priorities = current_user.priorities
      
   #    render 'index.json.jbuilder'
   #  end

   # end

 

   def change 
    old_priorities = current_user.priorities_hash
    percentage_sum = old_priorities.sum {|priority_name, percentage| percentage }
    puts "*" * 50
    puts "*" * 50
    p percentage_sum
    puts "*" * 50
    puts "*" * 50
    if percentage_sum > 99 && percentage_sum <= 100 #keep this check

      priority = Priority.find_or_create_by(tag_id: params[:tag_id], user_id: current_user.id) 
      priority.update(percentage: params[:percentage])
      priority.destroy if priority.percentage == 0

      modified_priorities = current_user.priorities_hash

      new_priorities = current_user.total_change(old_priorities, modified_priorities)

      new_priorities.each do |tag_name, new_percentage|
        tag = Tag.find_by(name: tag_name) 
        priority = current_user.priorities.find_by(tag_id: tag.id)
        priority.percentage = new_percentage
        priority.save
      end

      @priorities = current_user.priorities
      
      render 'index.json.jbuilder'
    else 
      render json: {errors: ["priorities are not balanced"]}, status: :bad_request
    end
   end
end
