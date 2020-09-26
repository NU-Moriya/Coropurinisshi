class BlogsController < ApplicationController
  before_action :authenticate_user!

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to blog_path(@blog.id)
    else 
      render "new"
    end
  end

  def index
    @blogs = Blog.all
    @user = current_user
  end

  def show
    @blog = Blog.find(params[:id])
    @user = @blog.user
  end



  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    redirect_to user_path(current_user.id)
  end


  private
  def blog_params
    params.require(:blog).permit(:title, :text)
  end
end
