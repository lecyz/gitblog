class PostsController < ApplicationController
  
  before_filter :login_required
  
  def index
    
    query = params[:query]
    if query.present?
      @posts = Post.where("lower(title) like ?", "%#{query}%")
      p = Post.where("lower(title) like ?", "%#{query}%")
      
      if p.present?
        flash[:notice] = "SUCCESSFULLY FOR FOUND"
      else
        flash[:notice] = "NOT FOUND"
      end

    else
      @posts = Post.order("created_at ASC")
      # flash[:notice] = "YOU MUST ENTERED VALUE"
    end

  end

  def new
    @post = Post.new
  end 

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    respond_to do |f|
      if @post.update_attributes(params[:post])
        f.html  { redirect_to(@post) }
        flash[:notice] = "POST UPDATED"
      else
      end
    end
    
  end

  def show
     @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = "NEW POST ADDED"
      redirect_to posts_url
    else
      render :new
    end
  end

  def destroy
     @post = Post.find(params[:id])
     @post.destroy
     redirect_to posts_url
  end

  private
    def login_required

      if session[:user_id].present?
        flash[:notice] = "SOMEONE IS LOGGED"
        # redirect_to posts_path
      else
        flash[:error] = "YOU MUST BE LOGIN !"
        redirect_to root_url
      end
    end
end
