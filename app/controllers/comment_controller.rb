class CommentController < ApplicationController

  def new
    @comments = Comment.where("music_id = #{params[:id].to_i}")
  end

  def edit
    @commend = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:comment_id])
    @comment[:review] = params[:review]
    @comment.save
    redirect_to "/music/#{@comment.music_id}"
  end

  def destroy
    @comment = Comment.find(params[:id])
    @music_id = @comment.music_id
    @comment.destroy
    redirect_to "/music/#{@music_id}"
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save
  end

  private
  def comment_params
    params.permit(:user_id, :music_id, :review)
  end

end
