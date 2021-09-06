class PagesController < ApplicationController
  before_action :sign_in_required, only: [:show]
  def index
  end

  def show
    @microposts = current_user.microposts.all
    @micropost = Micropost.new
  end
end
