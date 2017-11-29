class ContestsController < ApplicationController
  before_action :set_contest, only: [:show, :edit, :update, :destroy]
  before_action :provider?, only:[:create]
  layout 'layouts/application'
  # GET /contests
  # GET /contests.json
  def index
    @contests = Contest.all
  end

  def map
    @contest = Contest.find_by(id:params[:contest_id])
    respond_to do |format|
      format.json { head :no_content }
      format.js 
    end    
  end


  # GET /contests/1
  # GET /contests/1.json
  def show
    @ideas = @contest.ideas
    @comment = Comment.new
  end

  # GET /contests/new
  def new
    @contest = Contest.new
  end



  # GET /contests/1/edit
  def edit
  end

  # POST /contests
  # POST /contests.json
  def create
    @contest = current_member.contests.new(contest_params)    
    respond_to do |format|
      sectors_params.delete("")
      if @contest.save
        sectors_params.each do |k|
          @contest.sectors << Sector.find_by(id:k)
       end
        format.json { head :no_content }
        format.js
      else

        format.json { render :json => { :error => @contest.errors.full_messages }, :status => 422 }
      end
      
    end
  end

  # PATCH/PUT /contests/1
  # PATCH/PUT /contests/1.json
  def update
    respond_to do |format|
      if @contest.update(contest_params)
        format.html { redirect_to @contest, notice: 'Contest was successfully updated.' }
        format.json { render :show, status: :ok, location: @contest }
      else
        format.html { render :edit }
        format.json { render json: @contest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contests/1
  # DELETE /contests/1.json
  def destroy
    @contest.destroy
    respond_to do |format|
      format.html { redirect_to contests_url, notice: 'Contest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def provider?
      current_member.role==1 || current_member.role==2
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_contest
      @contest = Contest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contest_params
      params.require(:contest).permit(:title, :describe,:local,:kind,:longitude, :latitude)
    end

    def sectors_params
      params[:contest][:sector_ids]
    end
end
