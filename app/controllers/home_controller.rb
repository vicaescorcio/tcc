class HomeController < ApplicationController
  before_action :authenticate_member!
  layout 'layouts/application'
  def index
    @ideas = Idea.all
    @contests = Contest.all
    @comment = Comment.new
    gon.ideas = Idea.locals
    gon.contests = Contest.locals
  end

  def filtering
    @locals = Idea.locals 
    @locals  = Idea.joins(:ideas_sectors).where('ideas_sectors.sector_id' => params[:sector_ids]).locals if params[:sector_ids].present? 
    debugger
    
    respond_to do |format|
      format.html
      format.js
    end
  end
end
