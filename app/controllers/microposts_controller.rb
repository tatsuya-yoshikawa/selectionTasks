class MicropostsController < ApplicationController

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      redirect_to request.referer
    else
      render 'pages/index'
    end
  end

  def destroy
    @micropost = Micropost.find_by(id:params[:id])
    @micropost.destroy
    redirect_to request.referrer
  end

  def edit
    @micropost = Micropost.find_by(id:params[:id])
  end

  def update
    @micropost = Micropost.find_by(id:params[:id])
    @micropost.update_attributes(micropost_params)
    render 'pages/index'
  end

  private
    def micropost_params
      params.require(:micropost).permit(:content)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
