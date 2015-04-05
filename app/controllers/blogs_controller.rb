class BlogsController < ApplicationController

  before_action :get_blog ,:only => [:show ,:update,:edit]
  before_action :is_login, :only => [:edit,:update]

  def index
    #@blogs = Blog.page(params[:page]).per(5)
    @blogs = Blog.paginate :page => params[:page],
                           :per_page => 2
                           #:conditions => ["title like ?", "%#{params[:search]}%"]

  end

  def new
    @blog = Blog.new
  end

  def show

  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to :action => :index
    else
      render :new
    end

  end

  def edit

  end

  def update
    if @blog.update(blog_params)
      redirect_to blog_path(@blog)
    else
      render :edit
    end
  end

  private

  def get_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:id,:title,:html, :subtitle,:content,:is_publish,:tag_ids => [])
  end

  def is_login
    #puts "-------+++++++++",action_name, action_methods
    if session[:user].present? == false
      redirect_to login_path
    end
  end

end
