class PostController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
  end

  def get_emails
    binding.pry
    respond_to { |format| format.json { render json: {data:'no user'}.to_json } }
  end

end