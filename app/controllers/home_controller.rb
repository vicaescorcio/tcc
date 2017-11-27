class HomeController < ApplicationController
  before_action :authenticate_member!
  layout 'layouts/application'
  def index
    @ideas = Idea.all
    @contests = Contest.all
    @comment = Comment.new
  end
end
