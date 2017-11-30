class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy]
  layout 'layouts/application'
  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.all
  end


  def map
    @idea = Idea.find_by(id:params[:idea_id])
    respond_to do |format|
      format.json { head :no_content }
      format.js 
    end    
  end

  def like
    @idea = Idea.find_by(id:params[:id])
    toggle = 0
    if current_member.liked? @idea
      current_member.unlike @idea
      toggle = 1
    elsif current_member.disliked? @idea
      current_member.undislike @idea
      current_member.likes @idea
      toggle = 2
    else
      current_member.likes @idea
    end
    respond_to do |format|
      format.json { render json: [@idea.get_likes.size,@idea.get_dislikes.size,toggle,@idea.id]}
     end
  end
  
  def dislike
    @idea = Idea.find_by(id:params[:id])
    toggle = 0
    if current_member.disliked? @idea
      current_member.undislike @idea
      toggle = 1
    elsif current_member.liked? @idea
      current_member.unlike @idea
      current_member.dislikes @idea
      toggle = 2
    else
      current_member.dislikes @idea
    end
    respond_to do |format|
        format.json { render json: [@idea.get_likes.size,@idea.get_dislikes.size,toggle, @idea.id]}
    end

  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
    @comment = Comment.new
  end
  # GET /ideas/new
  def new
    @idea = Idea.new
    @contest = nil
    @contest = Contest.find_by(id:params[:format]) unless params[:format].nil?
  end
  # GET /ideas/1/edit
  def edit
  end
  # POST /ideas
  # POST /ideas.json
  def create
    @idea = current_member.ideas.new(idea_params)   
    respond_to do |format|
      @comment= Comment.new
      sectors_params.delete("")
      if @idea.save
        @idea.update(contest_id:params[:contest_id]) unless params[:contest_id].nil? 
        sectors_params.each do |k|
          @idea.sectors << Sector.find_by(id:k)
       end
        format.json { head :no_content }
        format.js       
      else

        format.json { render :json => { :error => @idea.errors.full_messages }, :status => 422 }
      end
      
    end
  end
  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @idea }
      else
        format.html { render :edit }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to ideas_url, notice: 'Idea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:title, :describe, :local,:kind,:longitude, :latitude)
    end
    def sectors_params
      params[:idea][:sector_ids]
    end
    def comment_params
      params.require(:comment).permit(:body)
    end
end
