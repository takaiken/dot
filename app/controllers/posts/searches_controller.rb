class Posts::SearchesController < ApplicationController
    def index
       @posts = Post.where('title LIKE(?)', "%#{params[:title]}%")
	     respond_to do |format|
			  format.html { redirect_to :root }
			  format.json { render json: @posts }
		   end 
    end
end