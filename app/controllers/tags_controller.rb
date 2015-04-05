class TagsController < ApplicationController

  before_action :is_login

  def index
    @tags = Tag.all
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to :action => :index
    else
      render :index
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name,:id)
  end

  private
  def is_login
    #puts "-------+++++++++",action_name, action_methods
    if session[:user].present? == false
      redirect_to login_path
    end
  end
end
