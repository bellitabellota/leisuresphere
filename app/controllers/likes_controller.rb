class LikesController < ApplicationController
  def create
    @like = Like.new(likeable_id: params[:likeable_id], likeable_type: params[:likeable_type], liker_id: params[:liker_id])
    @path = params[:path]
    @likeable = @like.likeable
    if @like.save
      @post = params[:post]
      redirect_to "#{@path}##{@likeable.class}-#{@likeable.id}"
    else
      redirect_to "#{@path}##{@likeable.class}-#{@likeable.id}"
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @path = params[:path]
    @likeable = @like.likeable

    @like.destroy
    redirect_to "#{@path}##{@likeable.class}-#{@likeable.id}", status: :see_other
  end
end
