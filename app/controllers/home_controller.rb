class HomeController < ApplicationController
  before_action :authenticate_member!
  layout 'layouts/application'
  def index
    @ideas = Idea.order(:cached_votes_up =>:desc)
  end
end
