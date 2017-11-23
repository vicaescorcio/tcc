class HomeController < ApplicationController
  before_action :authenticate_member!
  def index
    @ideas = Idea.all
  end
end
