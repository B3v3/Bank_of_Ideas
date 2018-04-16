class IdeaController < ApplicationController

  def index
    @ideas = Idea.all
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def new
    if logged_in?
    @idea = Idea.new
  else
    redirect_to root_path
  end 
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.user_id = current_user.id
    if @idea.save
      flash[:success]
      redirect_to @idea
    else
      render 'new'
    end
  end

    def destroy
      @idea = Idea.find(params[:id])
      @idea.destroy
      redirect_to root_path
    end

private
 def idea_params
   params.require(:idea).permit(:title, :body)
 end
end
