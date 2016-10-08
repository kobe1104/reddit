class SubsController < ApplicationController
  before_action :require_moderator, only: [:edit]
  #before_action :ensure_moderator_id, only: [:create]

  def new
  end

  def create
    @subs = Sub.new(sub_params)
    @subs.moderator_id = current_user.id
    if @subs.save
      redirect_to sub_url(@subs)
    else
      flash.now[:errors] = @subs.errors.full_messages
      render :new
    end
  end

  def show
    @subs =  Sub.find(params[:id])
  end

  def index
  end

  def edit
    @subs =  Sub.find(params[:id])
  end

  def update
    @subs = Sub.find(params[:id])
    @subs.update(sub_params)
    if @subs.save
      redirect_to sub_url(@subs)
    else
      flash.now[:errors] = @subs.errors.full_messages
      render :edit
    end
  end

  def require_moderator
    @subs = Sub.find(params[:id])
    unless current_user.id == @subs.moderator_id
      flash[:errors] = ["Invlaid user!"]
      redirect_to subs_url #index
    end
  end

  def ensure_moderator_id
    @subs = Sub.find(params[:id])
    @subs.moderator_id = current_user.id
  end

  private

  def sub_params
    params.require(:subs).permit(:title, :description, :moderator_id)
  end
end
