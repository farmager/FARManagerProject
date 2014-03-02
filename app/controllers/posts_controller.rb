class PostsController < ApplicationController    
before_action :signed_in_user
  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    
    if params[:quote]
      quote_post = Post.find(params[:quote])
      if quote_post
        @post.body = quote_post.body
      end
    end
  end
  
  
  
 
  
  
  
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build(permitted_params)
    @post.forum = @topic.forum
    @post.user = current_user
    
    if @post.save
      flash[:success] = "Post was successfully created."
      redirect_to topic_path(@post.topic)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(permitted_params)
      flash[:success] = "Post was successfully updated."
      redirect_to topic_path(@post.topic)
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    
    if @post.topic.posts_count > 1
      if @post.destroy
        flash[:success] = "Post was successfully destroyed."
        redirect_to topic_path(@post.topic)
      end
    else
      if @post.topic.destroy
        flash[:success] = "Topic was successfully deleted."
        redirect_to forum_path(@post.forum)
      end
    end
  end

  private

    def permitted_params
      params.require(:post).permit(:body)
    end

end