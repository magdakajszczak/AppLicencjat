class PostsController < ApplicationController
  
  def new
    @post = Post.new
  end 

  def create
    @post = Post.new(post_params)
    @post.user = current_user
     if @post.save 
    flash[:notice] = "Post dodany!"
    redirect_to posts_path
     else 
      render action: 'new'
     end
   end 

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:notice] = "Post zaktualizowany"
      redirect_to posts_path
    else
      render action: 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Skasowano"
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def index
    params[:tag] ? @posts = Post.tagged_with(params[:tag]) : @posts = Post.all
  end
  
  def published
    @posts = Post.where(published:true)
    render action: "index"
  end

  def show
    @post = Post.find(params[:id])
  end

  private

 def post_params
    params.require(:post).permit(:title, :body, :category_id, :tag_list, :tag, { tag_ids: [] }, :tag_ids)
  end
end
